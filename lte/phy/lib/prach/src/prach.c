/**
 *
 * \section COPYRIGHT
 *
 * Copyright 2013-2014 The libLTE Developers. See the
 * COPYRIGHT file at the top-level directory of this distribution.
 *
 * \section LICENSE
 *
 * This file is part of the libLTE library.
 *
 * libLTE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * libLTE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * A copy of the GNU Lesser General Public License can be found in
 * the LICENSE file in the top-level directory of this distribution
 * and at http://www.gnu.org/licenses/.
 *
 */

#include <math.h>
#include <string.h>
#include "liblte/error.h"
#include "liblte/phy/prach/prach.h"
#include "liblte/phy/utils/debug.h"

#define   N_SEQS        64    // Number of prach sequences available
#define   N_RB_SC       12    // Number of subcarriers per resource block
#define   DELTA_F       15000 // Normal subcarrier spacing
#define   DELTA_F_RA    1250  // PRACH subcarrier spacing
#define   DELTA_F_RA_4  7500  // PRACH subcarrier spacing for format 4
#define   PHI           7     // PRACH phi parameter
#define   PHI_4         2     // PRACH phi parameter for format 4
#define   MAX_ROOTS     838   // Max number of root sequences


/******************************************************
 * Reference tables from 3GPP TS 36.211 v10.7.0
 *****************************************************/

// Table 5.7.1-1 T_cp for preamble formats
uint32_t prach_Tcp[5] = {3168, 21024, 6240, 21024, 448};

// Table 5.7.1-1 T_seq for preamble formats
uint32_t prach_Tseq[5] = {24576, 24576, 2*24576, 2*24576, 4096};

// Table 5.7.2-2 - N_cs values for unrestricted sets
uint32_t prach_Ncs_unrestricted[16] = {0,13,15,18,22,26,32,38,46,59,76,93,119,167,279,419};

// Table 5.7.2-2 - N_cs values for restricted sets
uint32_t prach_Ncs_restricted[15] = {15,18,22,26,32,38,46,55,68,82,100,128,158,202,237};

// Table 5.7.2-3 - N_cs values for preamble format 4
uint32_t prach_Ncs_format4[7] = {2,4,6,8,10,12,15};

// Table 5.7.2-4 - Root ZC sequence order
uint32_t prach_zc_roots[838] = {
  129, 710, 140, 699, 120, 719, 210, 629, 168, 671,  84, 755,
  105, 734,  93, 746,  70, 769,  60, 779,   2, 837,   1, 838,
   56, 783, 112, 727, 148, 691,  80, 759,  42, 797,  40, 799,
   35, 804,  73, 766, 146, 693,  31, 808,  28, 811,  30, 809,
   27, 812,  29, 810,  24, 815,  48, 791,  68, 771,  74, 765,
  178, 661, 136, 703,  86, 753,  78, 761,  43, 796,  39, 800,
   20, 819,  21, 818,  95, 744, 202, 637, 190, 649, 181, 658,
  137, 702, 125, 714, 151, 688, 217, 622, 128, 711, 142, 697,
  122, 717, 203, 636, 118, 721, 110, 729,  89, 750, 103, 736,
   61, 778,  55, 784,  15, 824,  14, 825,  12, 827,  23, 816,
   34, 805,  37, 802,  46, 793, 207, 632, 179, 660, 145, 694,
  130, 709, 223, 616, 228, 611, 227, 612, 132, 707, 133, 706,
  143, 696, 135, 704, 161, 678, 201, 638, 173, 666, 106, 733,
   83, 756,  91, 748,  66, 773,  53, 786,  10, 829,   9, 830,
    7, 832,   8, 831,  16, 823,  47, 792,  64, 775,  57, 782,
  104, 735, 101, 738, 108, 731, 208, 631, 184, 655, 197, 642,
  191, 648, 121, 718, 141, 698, 149, 690, 216, 623, 218, 621,
  152, 687, 144, 695, 134, 705, 138, 701, 199, 640, 162, 677,
  176, 663, 119, 720, 158, 681, 164, 675, 174, 665, 171, 668,
  170, 669,  87, 752, 169, 670,  88, 751, 107, 732,  81, 758,
   82, 757, 100, 739,  98, 741,  71, 768,  59, 780,  65, 774,
   50, 789,  49, 790,  26, 813,  17, 822,  13, 826,   6, 833,
    5, 834,  33, 806,  51, 788,  75, 764,  99, 740,  96, 743,
   97, 742, 166, 673, 172, 667, 175, 664, 187, 652, 163, 676,
  185, 654, 200, 639, 114, 725, 189, 650, 115, 724, 194, 645,
  195, 644, 192, 647, 182, 657, 157, 682, 156, 683, 211, 628,
  154, 685, 123, 716, 139, 700, 212, 627, 153, 686, 213, 626,
  215, 624, 150, 689, 225, 614, 224, 615, 221, 618, 220, 619,
  127, 712, 147, 692, 124, 715, 193, 646, 205, 634, 206, 633,
  116, 723, 160, 679, 186, 653, 167, 672,  79, 760,  85, 754,
   77, 762,  92, 747,  58, 781,  62, 777,  69, 770,  54, 785,
   36, 803,  32, 807,  25, 814,  18, 821,  11, 828,   4, 835,
    3, 836,  19, 820,  22, 817,  41, 798,  38, 801,  44, 795,
   52, 787,  45, 794,  63, 776,  67, 772,  72, 767,  76, 763,
   94, 745, 102, 737,  90, 749, 109, 730, 165, 674, 111, 728,
  209, 630, 204, 635, 117, 722, 188, 651, 159, 680, 198, 641,
  113, 726, 183, 656, 180, 659, 177, 662, 196, 643, 155, 684,
  214, 625, 126, 713, 131, 708, 219, 620, 222, 617, 226, 613,
  230, 609, 232, 607, 262, 577, 252, 587, 418, 421, 416, 423,
  413, 426, 411, 428, 376, 463, 395, 444, 283, 556, 285, 554,
  379, 460, 390, 449, 363, 476, 384, 455, 388, 451, 386, 453,
  361, 478, 387, 452, 360, 479, 310, 529, 354, 485, 328, 511,
  315, 524, 337, 502, 349, 490, 335, 504, 324, 515, 323, 516,
  320, 519, 334, 505, 359, 480, 295, 544, 385, 454, 292, 547,
  291, 548, 381, 458, 399, 440, 380, 459, 397, 442, 369, 470,
  377, 462, 410, 429, 407, 432, 281, 558, 414, 425, 247, 592,
  277, 562, 271, 568, 272, 567, 264, 575, 259, 580, 237, 602,
  239, 600, 244, 595, 243, 596, 275, 564, 278, 561, 250, 589,
  246, 593, 417, 422, 248, 591, 394, 445, 393, 446, 370, 469,
  365, 474, 300, 539, 299, 540, 364, 475, 362, 477, 298, 541,
  312, 527, 313, 526, 314, 525, 353, 486, 352, 487, 343, 496,
  327, 512, 350, 489, 326, 513, 319, 520, 332, 507, 333, 506,
  348, 491, 347, 492, 322, 517, 330, 509, 338, 501, 341, 498,
  340, 499, 342, 497, 301, 538, 366, 473, 401, 438, 371, 468,
  408, 431, 375, 464, 249, 590, 269, 570, 238, 601, 234, 605,
  257, 582, 273, 566, 255, 584, 254, 585, 245, 594, 251, 588,
  412, 427, 372, 467, 282, 557, 403, 436, 396, 443, 392, 447,
  391, 448, 382, 457, 389, 450, 294, 545, 297, 542, 311, 528,
  344, 495, 345, 494, 318, 521, 331, 508, 325, 514, 321, 518,
  346, 493, 339, 500, 351, 488, 306, 533, 289, 550, 400, 439,
  378, 461, 374, 465, 415, 424, 270, 569, 241, 598, 231, 608,
  260, 579, 268, 571, 276, 563, 409, 430, 398, 441, 290, 549,
  304, 535, 308, 531, 358, 481, 316, 523, 293, 546, 288, 551,
  284, 555, 368, 471, 253, 586, 256, 583, 263, 576, 242, 597,
  274, 565, 402, 437, 383, 456, 357, 482, 329, 510, 317, 522,
  307, 532, 286, 553, 287, 552, 266, 573, 261, 578, 236, 603,
  303, 536, 356, 483, 355, 484, 405, 434, 404, 435, 406, 433,
  235, 604, 267, 572, 302, 537, 309, 530, 265, 574, 233, 606,
  367, 472, 296, 543, 336, 503, 305, 534, 373, 466, 280, 559,
  279, 560, 419, 420, 240, 599, 258, 581, 229, 610};

// Table 5.7.2-5 - Root ZC sequence order for preamble format 4
uint32_t prach_zc_roots_format4[138] = {
   1, 138,   2, 137,   3, 136,   4, 135,   5, 134,   6, 133,
   7, 132,   8, 131,   9, 130,  10, 129,  11, 128,  12, 127,
  13, 126,  14, 125,  15, 124,  16, 123,  17, 122,  18, 121,
  19, 120,  20, 119,  21, 118,  22, 117,  23, 116,  24, 115,
  25, 114,  26, 113,  27, 112,  28, 111,  29, 110,  30, 109,
  31, 108,  32, 107,  33, 106,  34, 105,  35, 104,  36, 103,
  37, 102,  38, 101,  39, 100,  40,  99,  41,  98,  42,  97,
  43,  96,  44,  95,  45,  94,  46,  93,  47,  92,  48,  91,
  49,  90,  50,  89,  51,  88,  52,  87,  53,  86,  54,  85,
  55,  84,  56,  83,  57,  82,  58,  81,  59,  80,  60,  79,
  61,  78,  62,  77,  63,  76,  64,  75,  65,  74,  66,  73,
  67,  72,  68,  71,  69,  70};

// For debug use only
void print(void *d, uint32_t size, uint32_t len, char* file_str)
{
  FILE *f;
  f = fopen(file_str, "wb");
  fwrite(d , size, len, f);
  fclose(f);
}

uint32_t prach_get_rb_ul(uint32_t N_ifft_ul)
{
  switch(N_ifft_ul)
  {
  case 128:
    return 6;
  case 256:
    return 15;
  case 512:
    return 25;
  case 1024:
    return 50;
  case 1536:
    return 75;
  case 2048:
    return 100;
  default:
    return 0;
  }
}

int prach_gen_seqs(prach_t *p)
{
  uint32_t u = 0;
  uint32_t v = 1;
  uint32_t v_max = 0;
  uint32_t p_ = 0;
  uint32_t d_u = 0;
  uint32_t d_start = 0;
  uint32_t N_shift = 0;
  uint32_t N_neg_shift = 0;
  uint32_t N_group = 0;
  uint32_t C_v = 0;
  cf_t root[839];

  // Generate our 64 preamble sequences
  for(int i=0;i<N_SEQS;i++){

    if(v > v_max){
      // Get a new root sequence
      if(4 == p->f){
        u = prach_zc_roots_format4[p->rsi + p->N_roots];
      }else{
        u = prach_zc_roots[p->rsi + p->N_roots];
      }
      for(int j=0;j<p->N_zc;j++){
        double phase = -M_PI*u*j*(j+1)/p->N_zc;
        root[j] = cexp(phase*I);
      }
      p->root_seqs_idx[p->N_roots++] = i;

      // Determine v_max
      if(p->hs){
        // High-speed cell
        for(p_=1; p_<=p->N_zc; p_++){
            if(((p_*u) % p->N_zc) == 1)
                break;
        }
        if(p_ >= 0 && p_ < p->N_zc/2){
            d_u = p_;
        }else{
            d_u = p->N_zc - p_;
        }
        if(d_u >= p->N_cs && d_u < p->N_zc/3){
            N_shift = d_u/p->N_cs;
            d_start = 2*d_u + N_shift*p->N_cs;
            N_group = p->N_zc/d_start;
            N_neg_shift = (p->N_zc - 2*d_u - N_group*d_start)/p->N_cs;
            if(N_neg_shift < 0)
                N_neg_shift = 0;
        }else{
            N_shift = (p->N_zc - 2*d_u)/p->N_cs;
            d_start = p->N_zc - 2*d_u + N_shift*p->N_cs;
            N_group = d_u/d_start;
            N_neg_shift = (d_u - N_group*d_start)/p->N_cs;
            if(N_neg_shift < 0)
                N_neg_shift = 0;
            if(N_neg_shift > N_shift)
                N_neg_shift = N_shift;
        }
        v_max = N_shift*N_group + N_neg_shift - 1;

      }else{
        // Normal cell
        if(0 == p->N_cs){
          v_max = 0;
        }else{
          v_max = (p->N_zc/p->N_cs)-1;
        }
      }

      v=0;
    }

    // Shift root and add to set
    if(p->hs){
      C_v = d_start*floor(v/N_shift) + (v % N_shift)*p->N_cs;
    }else{
      C_v = v*p->N_cs;
    }
    for(int j=0;j<p->N_zc;j++){
      p->seqs[i][j] = root[(j+C_v) % p->N_zc];
    }

    v++;
  }
  return 0;
}

int prach_init(prach_t *p,
               uint32_t N_ifft_ul,
               uint32_t preamble_format,
               uint32_t root_seq_index,
               bool high_speed_flag,
               uint32_t zero_corr_zone_config)
{
  LIBLTE_ERROR_ENUM ret = LIBLTE_ERROR;
  if(p                      != NULL      &&
     N_ifft_ul              <  2049      &&
     preamble_format        <  4         && // Currently supporting formats 0-3
     root_seq_index         <  MAX_ROOTS &&
     zero_corr_zone_config  < 16)
  {

    p->f = preamble_format;
    p->rsi = root_seq_index;
    p->hs = high_speed_flag;
    p->zczc = zero_corr_zone_config;

    // Determine N_zc and N_cs
    if(4 == preamble_format){
      p->N_zc = 139;
      p->N_cs = prach_Ncs_format4[p->zczc];
    }else{
      p->N_zc = 839;
      if(p->hs){
        p->N_cs = prach_Ncs_restricted[p->zczc];
      }else{
        p->N_cs = prach_Ncs_unrestricted[p->zczc];
      }
    }

    // Set up containers
    p->prach_bins = malloc(sizeof(cf_t)*p->N_zc);
    p->corr_spec = malloc(sizeof(cf_t)*p->N_zc);
    p->corr = malloc(sizeof(float)*p->N_zc);

    // Set up ZC FFTS
    p->zc_fft = (dft_plan_t*)malloc(sizeof(dft_plan_t));
    if(dft_plan(p->zc_fft, p->N_zc, FORWARD, COMPLEX)){
      return LIBLTE_ERROR;
    }
    dft_plan_set_mirror(p->zc_fft, true);
    dft_plan_set_norm(p->zc_fft, true);

    p->zc_ifft = (dft_plan_t*)malloc(sizeof(dft_plan_t));
    if(dft_plan(p->zc_ifft, p->N_zc, BACKWARD, COMPLEX)){
      return LIBLTE_ERROR;
    }
    dft_plan_set_mirror(p->zc_ifft, true);
    dft_plan_set_norm(p->zc_ifft, true);

    // Generate our 64 sequences
    p->N_roots = 0;
    prach_gen_seqs(p);

    // Generate sequence FFTs
    for(int i=0;i<N_SEQS;i++){
      dft_run(p->zc_fft, p->seqs[i], p->dft_seqs[i]);
    }

    // Create our FFT objects and buffers
    p->N_ifft_ul = N_ifft_ul;
    if(4 == preamble_format){
      p->N_ifft_prach = p->N_ifft_ul * DELTA_F/DELTA_F_RA_4;
    }else{
      p->N_ifft_prach = p->N_ifft_ul * DELTA_F/DELTA_F_RA;
    }

    p->ifft_in = (cf_t*)malloc(p->N_ifft_prach*sizeof(cf_t));
    p->ifft_out = (cf_t*)malloc(p->N_ifft_prach*sizeof(cf_t));
    p->ifft = (dft_plan_t*)malloc(sizeof(dft_plan_t));
    if(dft_plan(p->ifft, p->N_ifft_prach, BACKWARD, COMPLEX)){
       return -1;
    }
    dft_plan_set_mirror(p->ifft, true);
    dft_plan_set_norm(p->ifft, true);

    p->fft = (dft_plan_t*)malloc(sizeof(dft_plan_t));
    if(dft_plan(p->fft, p->N_ifft_prach, FORWARD, COMPLEX)){
       return -1;
    }
    dft_plan_set_mirror(p->fft, true);
    dft_plan_set_norm(p->fft, true);

    p->N_seq = prach_Tseq[p->f]*p->N_ifft_ul/2048;
    p->N_cp = prach_Tcp[p->f]*p->N_ifft_ul/2048;

    ret = LIBLTE_SUCCESS;
  }

  return ret;
}

int prach_gen(prach_t *p,
              uint32_t seq_index,
              uint32_t freq_offset,
              cf_t *signal)
{
  LIBLTE_ERROR_ENUM ret = LIBLTE_ERROR;
  if(p          != NULL   &&
     seq_index  <  N_SEQS &&
     signal     != NULL)
  {
    // Calculate parameters
    uint32_t N_rb_ul = prach_get_rb_ul(p->N_ifft_ul);
    uint32_t k_0 = freq_offset*N_RB_SC - N_rb_ul*N_RB_SC/2 + p->N_ifft_ul/2;
    uint32_t K = DELTA_F/DELTA_F_RA;
    uint32_t begin = PHI + (K*k_0) + (K/2);

    // Map dft-precoded sequence to ifft bins
    memset(p->ifft_in, 0, p->N_ifft_prach*sizeof(cf_t));
    for(int i=0;i<p->N_zc;i++){
      p->ifft_in[begin+i] = p->dft_seqs[seq_index][i];
    }
    dft_run(p->ifft, p->ifft_in, p->ifft_out);

    // Copy CP into buffer
    for(int i=0;i<p->N_cp;i++){
      signal[i] = p->ifft_out[p->N_ifft_prach-p->N_cp+i];
    }

    // Copy preamble sequence into buffer
    for(int i=0;i<p->N_seq;i++){
      signal[p->N_cp+i] = p->ifft_out[i%p->N_ifft_prach];
    }

    ret = LIBLTE_SUCCESS;
  }

  return ret;
}


int prach_detect(prach_t *p,
                 uint32_t freq_offset,
                 cf_t *signal,
                 uint32_t sig_len,
                 uint32_t *indices,
                 uint32_t *n_indices)
{
  LIBLTE_ERROR_ENUM ret = LIBLTE_ERROR;
  if(p       != NULL &&
     signal  != NULL &&
     sig_len > 0     &&
     indices != NULL)
  {
    if(sig_len != p->N_ifft_prach){
      INFO("prach_detect: Signal is not of length %d", p->N_ifft_prach);
      return LIBLTE_ERROR_INVALID_INPUTS;
    }

    // FFT incoming signal
    dft_run(p->fft, signal, signal);

    memset(p->prach_bins, 0, sizeof(cf_t)*p->N_zc);
    *n_indices = 0;

    // Extract bins of interest
    uint32_t N_rb_ul = prach_get_rb_ul(p->N_ifft_ul);
    uint32_t k_0 = freq_offset*N_RB_SC - N_rb_ul*N_RB_SC/2 + p->N_ifft_ul/2;
    uint32_t K = DELTA_F/DELTA_F_RA;
    uint32_t begin = PHI + (K*k_0) + (K/2);

    for(int i=0;i<p->N_zc;i++){
      p->prach_bins[i] = signal[begin+i];
    }

    for(int i=0;i<p->N_roots;i++){
      memset(p->corr_spec, 0, sizeof(cf_t)*p->N_zc);
      memset(p->corr, 0, sizeof(float)*p->N_zc);
      float corr_max = 0;

      cf_t *root_spec = p->dft_seqs[p->root_seqs_idx[i]];

      for(int j=0;j<p->N_zc;j++){
        p->corr_spec[j] = p->prach_bins[j]*conjf(root_spec[j]);
      }

      dft_run(p->zc_ifft, p->corr_spec, p->corr_spec);

      float norm = sqrtf(p->N_zc);
      for(int j=0;j<p->N_zc;j++){
        p->corr[j] = cabsf(p->corr_spec[j])/norm;
      }

      uint32_t winsize = 0;
      if(p->N_cs != 0){
        winsize = p->N_cs;
      }else{
        winsize = p->N_zc;
      }
      uint32_t n_wins = p->N_zc/winsize;
      for(int j=0;j<n_wins;j++){
        uint32_t start = (p->N_zc-(j*p->N_cs))%p->N_zc;
        uint32_t end = start+winsize;
        corr_max = 0;
        for(int k=start;k<end;k++){
          if(p->corr[k] > corr_max){
            corr_max = p->corr[k];
          }
        }
        if(corr_max > PRACH_DETECT_THRESH){
          indices[*n_indices] = (i*n_wins)+j;
          (*n_indices)++;
        }
      }
    }

    ret = LIBLTE_SUCCESS;
  }
  return ret;
}

int prach_free(prach_t *p){
  free(p->prach_bins);
  free(p->corr);
  dft_plan_free(p->ifft);
  free(p->ifft);
  free(p->ifft_in);
  free(p->ifft_out);
  dft_plan_free(p->fft);
  free(p->fft);
  dft_plan_free(p->zc_fft);
  free(p->zc_fft);
  dft_plan_free(p->zc_ifft);
  free(p->zc_ifft);

  return 0;
}

int prach_print_seqs(prach_t *p)
{
  for(int i=0; i<N_SEQS;i++)
  {
    FILE *f;
    char str[32];
    sprintf(str, "prach_seq_%d.bin", i);
    f = fopen(str, "wb");
    fwrite(p->seqs[i] , sizeof(cf_t), p->N_zc, f);
    fclose(f);
  }
  for(int i=0; i<N_SEQS;i++)
  {
    FILE *f;
    char str[32];
    sprintf(str, "prach_dft_seq_%d.bin", i);
    f = fopen(str, "wb");
    fwrite(p->dft_seqs[i] , sizeof(cf_t), p->N_zc, f);
    fclose(f);
  }
  for(int i=0;i<p->N_roots;i++)
  {
    FILE *f;
    char str[32];
    sprintf(str, "prach_root_seq_%d.bin", i);
    f = fopen(str, "wb");
    fwrite(p->seqs[p->root_seqs_idx[i]] , sizeof(cf_t), p->N_zc, f);
    fclose(f);
  }
  return 0;
}
