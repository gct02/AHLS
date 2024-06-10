#ifndef __ADPCM_H__
#define __ADPCM_H__

#define SIZE 8000

void
adpcm_main (const int input_samples[SIZE], int compressed[SIZE/2], int result[SIZE]);

#endif // __ADPCM_H__