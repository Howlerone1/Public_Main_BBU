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

#include <stdbool.h>
#include <stdint.h>
  
#include "srslte/config.h"
#include "srslte/rf/rf.h"

SRSLTE_API int rf_zed_open(char *args,
                        void **handler);

SRSLTE_API int rf_zed_close(void *h);

SRSLTE_API void rf_zed_set_tx_cal(void *h, srslte_rf_cal_t *cal);

SRSLTE_API void rf_zed_set_rx_cal(void *h, srslte_rf_cal_t *cal);

SRSLTE_API int rf_zed_start_rx_stream(void *h);

SRSLTE_API int rf_zed_start_rx_stream_nsamples(void *h,
                                            uint32_t nsamples);

SRSLTE_API int rf_zed_stop_rx_stream(void *h);

SRSLTE_API void rf_zed_flush_buffer(void *h);

SRSLTE_API bool rf_zed_has_rssi(void *h);

SRSLTE_API float rf_zed_get_rssi(void *h);

SRSLTE_API bool rf_zed_rx_wait_lo_locked(void *h);

SRSLTE_API void rf_zed_set_master_clock_rate(void *h,
                                          double rate); 

SRSLTE_API bool rf_zed_is_master_clock_dynamic(void *h);

SRSLTE_API double rf_zed_set_rx_srate(void *h,
                                   double freq);

SRSLTE_API double rf_zed_set_rx_gain(void *h,
                                  double gain);

SRSLTE_API double rf_zed_get_rx_gain(void *h);

SRSLTE_API double rf_zed_get_tx_gain(void *h);

SRSLTE_API void rf_zed_suppress_stdout(void *h);

SRSLTE_API void rf_zed_register_error_handler(void *h, srslte_rf_error_handler_t error_handler);

SRSLTE_API double rf_zed_set_rx_freq(void *h,
                                  double freq);

SRSLTE_API int rf_zed_recv_with_time(void *h,
                                  void *data,
                                  uint32_t nsamples,
                                  bool blocking,
                                  time_t *secs,
                                  double *frac_secs);

SRSLTE_API double rf_zed_set_tx_srate(void *h,
                                    double freq);

SRSLTE_API double rf_zed_set_tx_gain(void *h,
                                   double gain);

SRSLTE_API double rf_zed_set_tx_freq(void *h,
                                   double freq);

SRSLTE_API void rf_zed_get_time(void *h,
                              time_t *secs, 
                              double *frac_secs); 

SRSLTE_API int  rf_zed_send_timed(void *h,
                                  void *data, 
                                  int nsamples,
                                  time_t secs, 
                                  double frac_secs, 
                                  bool has_time_spec,
                                  bool blocking, 
                                  bool is_start_of_burst, 
                                  bool is_end_of_burst);

