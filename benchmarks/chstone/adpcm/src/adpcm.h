#ifndef __ADPCM_H__
#define __ADPCM_H__

void
adpcm_main (const int* input_samples, int* compressed, int* result, int num_samples);

#endif // __ADPCM_H__