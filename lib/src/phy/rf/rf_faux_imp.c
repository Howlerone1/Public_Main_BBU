/**
 *
 * \section COPYRIGHT
 *
 * Copyright 2013-2015 Software Radio Systems Limited
 *
 * \section LICENSE
 *
 * This file is part of the srsLTE library.
 *
 * srsLTE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * srsLTE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * A copy of the GNU Affero General Public License can be found in
 * the LICENSE file in the top-level directory of this distribution
 * and at http://www.gnu.org/licenses/.
 *
 */

#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <assert.h>
#include <fcntl.h>
#include <errno.h>

#include <zmq.h>

#include <sys/time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>

#include "srslte/srslte.h"
#include "rf_faux_imp.h"
#include "srslte/phy/rf/rf.h"

static bool _faux_rf_logStdout = true;

#define FAUX_RF_DEBUG(fmt, ...) do {                                                              \
                                 if(_faux_rf_logStdout) {                                         \
                                   struct timeval _tv_now;                                        \
                                   struct tm _tm;                                                 \
                                   gettimeofday(&_tv_now, NULL);                                  \
                                   localtime_r(&_tv_now.tv_sec, &_tm);                            \
                                   fprintf(stdout, "%02d.%02d.%02d.%06ld %s [DEBUG], " fmt "\n",  \
                                           _tm.tm_hour,                                           \
                                           _tm.tm_min,                                            \
                                           _tm.tm_sec,                                            \
                                           _tv_now.tv_usec,                                       \
                                           __func__,                                              \
                                           ##__VA_ARGS__);                                        \
                                 }                                                                \
                             } while(0);

#define FAUX_RF_LOG_FUNC_TODO printf("XXX_TODO file:%s func:%s line:%d\n", __FILE__, __func__, __LINE__)

#define FAUX_RF_BOOL_TO_STR(x) (x) ? "yes" : "no"

#define FAUX_RF_USEC_X_SEC 1000000

#define FAUX_RF_ENB_PORT 43001
#define FAUX_RF_UE_PORT  43002

#define SAMPLES_TO_BYTES(x) ((x) * sizeof(cf_t))

static const cf_t _zeros[1 << 20]= {0.0, 0.0};

static void _faux_rf_tv_to_ts(struct timeval *tv, time_t *s, double *f)
{
  if(s && f)
    {
      *s = tv->tv_sec; 
      *f = tv->tv_usec / 1.0e6;
    }
}

static void _faux_rf_ts_to_tv(struct timeval *tv, time_t s, double f)
{
  if(tv)
    {
      tv->tv_sec  = s;
      tv->tv_usec = f * 1.0e6;
    }
}

static void _faux_rf_dif_time(time_t secs, double frac, struct timeval * tv_dif)
{
   struct timeval tv_now, tv_nxt;

   gettimeofday(&tv_now, NULL);

   _faux_rf_ts_to_tv(&tv_nxt, secs, frac);

   if(secs || frac)
    {
      timersub(&tv_nxt, &tv_now, tv_dif);
    }
   else
    {
      tv_dif->tv_sec  = 0;
      tv_dif->tv_usec = 0;
    }
}


#define FAUX_RF_TYPE_NONE   0
#define FAUX_RF_TYPE_UE     1
#define FAUX_RF_TYPE_ENB    2

typedef struct 
 {
   char  *devName;
   double rxGain;
   double txGain;
   double rxRate;
   double txRate;
   double rxFreq;
   double txFreq;
   double txCal;
   double rxCal;
   double clockRate;
   void   (*error_handler)(srslte_rf_error_t error);
   bool   rxStream;
   int    type;
   void * zmqctx;
   void * req;
   void * rep;
 } faux_rf_info_t;


static bool _faux_rf_is_enb(faux_rf_info_t * h)
{
  return (h->type == FAUX_RF_TYPE_ENB);
}

static const char * make_endpoint(char buff[64], 
                                  const char * type,
                                  const char * addr,
                                  unsigned short port)
{
  snprintf(buff, 64, "%s://%s:%hu", type, addr, port); 

  FAUX_RF_DEBUG("create endpoint %s\n", buff);

  return buff;
}

static int _faux_rf_open_ipc_zmq(faux_rf_info_t * h)
{
  h->zmqctx = zmq_ctx_new();

  const unsigned short rxPort = _faux_rf_is_enb(h) ? 
                                FAUX_RF_ENB_PORT : 
                                FAUX_RF_UE_PORT;

  const unsigned short txPort = _faux_rf_is_enb(h) ? 
                                FAUX_RF_UE_PORT : 
                                FAUX_RF_ENB_PORT;

  if((h->req = zmq_socket(h->zmqctx, ZMQ_REQ)) == NULL)
    {
      FAUX_RF_DEBUG("error opening REQ sock %s\n", strerror(errno));

      return -1;
    }

  if((h->rep = zmq_socket(h->zmqctx, ZMQ_REP)) == NULL)
    {
      FAUX_RF_DEBUG("error opening REP sock %s\n", strerror(errno));

      return -1;
    }

  char ep[64] = {0};

  if(zmq_connect(h->req, make_endpoint(ep, "tcp", "127.0.0.1", txPort)) < 0)
    {
      FAUX_RF_DEBUG("error connecting REQ sock %s\n", strerror(errno));

      return -1;
    }

   if(zmq_bind(h->rep, make_endpoint(ep, "tcp", "*", rxPort)) < 0)
    {
      FAUX_RF_DEBUG("error binding REP sock %s\n", strerror(errno));

      return -1;
    }

    // timeout 1 msec (1 sf)
  const int timeout = 1;

  if(zmq_setsockopt(h->rep, ZMQ_RCVTIMEO, &timeout, sizeof(timeout)) < 0)
    {
      FAUX_RF_DEBUG("error set rcv timoeout to %d for REP sock %s\n", timeout, strerror(errno));

      return -1;
    }

  if(zmq_setsockopt(h->rep, ZMQ_SNDTIMEO, &timeout, sizeof(timeout)) < 0)
    {
      FAUX_RF_DEBUG("error set snd timoeout to %d for REP sock %s\n", timeout, strerror(errno));

      return -1;
    }

  FAUX_RF_DEBUG("set snd/rcv timoeout to %d for REP sock %s\n", timeout);
 
  return 0;
}



static void faux_rf_handle_error(srslte_rf_error_t error)
{
  FAUX_RF_DEBUG("%s:%s type %s, opt %d, msg %s\b", 
                error.type == SRSLTE_RF_ERROR_LATE      ? "late"      :
                error.type == SRSLTE_RF_ERROR_UNDERFLOW ? "underflow" :
                error.type == SRSLTE_RF_ERROR_OVERFLOW  ? "overflow"  :
                error.type == SRSLTE_RF_ERROR_OTHER     ? "other"     :
                "unknown error");
}

static  faux_rf_info_t _faux_rf_info = { .devName       = "faux",
                                         .rxGain        = 0.0,
                                         .txGain        = 0.0,
                                         .rxRate        = 0.0,
                                         .txRate        = 0.0,
                                         .rxFreq        = 0.0,
                                         .txFreq        = 0.0,
                                         .rxCal         = 0.0,
                                         .txCal         = 0.0,
                                         .clockRate     = 0.0,
                                         .error_handler = faux_rf_handle_error,
                                         .rxStream      = false,
                                         .type          = FAUX_RF_TYPE_NONE,
                                         .zmqctx        = NULL,
                                         .req           = NULL,
                                         .rep           = NULL,
                                       };

// could just as well use _faux_rf_info for single antenna mode
#define GET_FAUX_INFO(h)  assert(h); faux_rf_info_t *_info = (faux_rf_info_t *)(h)

char* rf_faux_devname(void *h)
 {
   GET_FAUX_INFO(h);

   return _info->devName;
 }


bool rf_faux_rx_wait_lo_locked(void *h)
 {
   FAUX_RF_LOG_FUNC_TODO;

   return false;
 }


int rf_faux_start_rx_stream(void *h)
 {
   GET_FAUX_INFO(h);
   
   FAUX_RF_DEBUG("");

   _info->rxStream = true;

   return 0;
 }


int rf_faux_stop_rx_stream(void *h)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("");

   _info->rxStream = false;

   return 0;
 }


void rf_faux_flush_buffer(void *h)
 {
   FAUX_RF_LOG_FUNC_TODO;
 }


bool rf_faux_has_rssi(void *h)
 {
   FAUX_RF_LOG_FUNC_TODO;

   return false;
 }


float rf_faux_get_rssi(void *h)
 {
   FAUX_RF_LOG_FUNC_TODO;

   return 0.0;
 }


void rf_faux_suppress_stdout(void *h)
 {
   // _faux_rf_logStdout = false;
 }


void rf_faux_register_error_handler(void *h, srslte_rf_error_handler_t error_handler)
 {
   GET_FAUX_INFO(h);

   _info->error_handler = error_handler;
 }


int rf_faux_open(char *args, void **h)
 {
   return rf_faux_open_multi(args, h, 1);
 }


int rf_faux_open_multi(char *args, void **h, uint32_t nof_channels)
 {
   FAUX_RF_DEBUG("channels %u, args [%s]", nof_channels, args);

   if(strncmp(args, "enb", strlen("enb")) == 0)
    {
      _faux_rf_info.type = FAUX_RF_TYPE_ENB;
    }
   else if(strncmp(args, "ue", strlen("ue")) == 0)
    {
      _faux_rf_info.type = FAUX_RF_TYPE_UE;
    }
   else
    {
      FAUX_RF_DEBUG("default type is ue");

      _faux_rf_info.type = FAUX_RF_TYPE_UE;
    }
       
   if(nof_channels != 1)
    {
      FAUX_RF_DEBUG("only supporting 1 channel, not %d", nof_channels);

      return -1;
    }

   if(_faux_rf_open_ipc_zmq(&_faux_rf_info) < 0)
     {
       FAUX_RF_DEBUG("could not creat ipc channel\n");

       return -1;
     }

   *h = &_faux_rf_info;

   return 0;
 }


int rf_faux_close(void *h)
 {
   GET_FAUX_INFO(h);

   zmq_ctx_destroy(_info->zmqctx);

   return 0;
 }


void rf_faux_set_master_clock_rate(void *h, double rate)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("rate %lf to %lf", _info->clockRate, rate);

   _info->clockRate = rate;
 }


bool rf_faux_is_master_clock_dynamic(void *h)
 {
   FAUX_RF_LOG_FUNC_TODO;

   return false;
 }


double rf_faux_set_rx_srate(void *h, double rate)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("rate %lf to %lf", _info->rxRate, rate);

   _info->rxRate = rate;

   return _info->rxRate;
 }


double rf_faux_set_rx_gain(void *h, double gain)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("gain %lf to %lf", _info->rxGain, gain);

   _info->rxGain = gain;

   return _info->rxGain;
 }


double rf_faux_set_tx_gain(void *h, double gain)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("gain %lf to %lf", _info->txGain, gain);

   _info->txGain = gain;

   return _info->txGain;
 }


double rf_faux_get_rx_gain(void *h)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("gain %lf", _info->rxGain);

   return _info->rxGain;
 }


double rf_faux_get_tx_gain(void *h)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("gain %lf", _info->txGain);

   return _info->txGain;
 }


double rf_faux_set_rx_freq(void *h, double freq)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("freq %lf to %lf", _info->rxFreq, freq);

   _info->rxFreq = freq;

   return _info->rxFreq;
 }


double rf_faux_set_tx_srate(void *h, double rate)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("rate %lf to %lf", _info->txRate, rate);

   _info->txRate = rate;

   return _info->txRate;
 }


double rf_faux_set_tx_freq(void *h, double freq)
 {
   GET_FAUX_INFO(h);

   FAUX_RF_DEBUG("freq %lf to %lf", _info->txFreq, freq);

   _info->txFreq = freq;

   return _info->txFreq;
 }


void rf_faux_get_time(void *h, time_t *secs, double *frac_secs)
 {
   struct timeval tv;

   gettimeofday(&tv, NULL);

   _faux_rf_tv_to_ts(&tv, secs, frac_secs);
 }


int rf_faux_recv_with_time(void *h, void *data, uint32_t nsamples, 
                           bool blocking, time_t *secs, double *frac_secs)
 {
   GET_FAUX_INFO(h);

   int bytesToRecv = SAMPLES_TO_BYTES(nsamples);

   FAUX_RF_DEBUG("request samples %u, bytes %d, blocking %s", 
                 nsamples,
                 bytesToRecv,
                 blocking ? "yes" : "no");

   memcpy(data, _zeros, bytesToRecv);

   int rc = zmq_recv(_info->rep, data, bytesToRecv, blocking ? ZMQ_NOBLOCK : 0);

   if(rc < 0)
     {
       if(errno != EAGAIN)
         {
           FAUX_RF_DEBUG("recv error %s", strerror(errno));

           return -1;
         }
       else
         {
           rc = 0;
         }
     }
   else
    {

      zmq_send(_info->rep, "OK", strlen("OK"),0);
    }

   FAUX_RF_DEBUG("recv %d, of %d", rc, bytesToRecv);

   rf_faux_get_time(h, secs, frac_secs);

   return nsamples;
 }


int rf_faux_recv_with_time_multi(void *h, void **data, uint32_t nsamples, 
                                 bool blocking, time_t *secs, double *frac_secs)
{
   return rf_faux_recv_with_time(h, 
                                 data[0],
                                 nsamples, 
                                 blocking,
                                 secs,
                                 frac_secs);
}


int rf_faux_send_timed(void *h, void *data, int nsamples,
                       time_t secs, double frac_secs, bool has_time_spec,
                       bool blocking, bool is_start_of_burst, bool is_end_of_burst)
{
   GET_FAUX_INFO(h);

   struct timeval tv_dif;

   _faux_rf_dif_time(secs, frac_secs, &tv_dif);

   int bytesToSend = SAMPLES_TO_BYTES(nsamples);

   FAUX_RF_DEBUG("nsamples %u, bytes %d, offset %ld:%06ld, sob %s, eob %s", 
              nsamples,
              bytesToSend,
              tv_dif.tv_sec,
              tv_dif.tv_usec,
              FAUX_RF_BOOL_TO_STR(is_start_of_burst),
              FAUX_RF_BOOL_TO_STR(is_end_of_burst));

   int rc = zmq_send(_info->req, data, bytesToSend, blocking ? ZMQ_NOBLOCK : 0);

   char response[3] = {0};

   if(rc < 0)
     {
       if(errno != EAGAIN)
         {
           FAUX_RF_DEBUG("send error %s", strerror(errno));

           return -1;
         }
       else
         {
           rc = 0;
         }
     }
   else
     {
       if(zmq_recv(_info->req, response, 2, 0) < 0)
         {
           FAUX_RF_DEBUG("recv response error %s", strerror(errno));
         }
     }

   FAUX_RF_DEBUG("sent %d bytes of %d, response %s", rc, bytesToSend, response);

   return nsamples;
}


int rf_faux_send_timed_multi(void *h, void *data[4], int nsamples,
                             time_t secs, double frac_secs, bool has_time_spec,
                             bool blocking, bool is_start_of_burst, bool is_end_of_burst)
{
  return rf_faux_send_timed(h, 
                            data[0], 
                            nsamples,
                            secs,
                            frac_secs,
                            has_time_spec,
                            blocking,
                            is_start_of_burst,
                            is_end_of_burst);
}


void rf_faux_set_tx_cal(void *h, srslte_rf_cal_t *cal)
{
   FAUX_RF_DEBUG("gain %f, phase %f, i %f, q %f", 
              cal->dc_gain, cal->dc_phase, cal->iq_i, cal->iq_q);
}


void rf_faux_set_rx_cal(void *h, srslte_rf_cal_t *cal)
{
   FAUX_RF_DEBUG("gain %f, phase %f, i %f, q %f", 
           cal->dc_gain, cal->dc_phase, cal->iq_i, cal->iq_q);

}
