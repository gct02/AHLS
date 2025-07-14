set_directive_pipeline -off fft1D_512/loop1
set_directive_pipeline -off fft1D_512/loop2
set_directive_pipeline -off fft1D_512/loop3
set_directive_pipeline -off fft1D_512/loop4
set_directive_pipeline -off fft1D_512/loop5
set_directive_pipeline -off fft1D_512/loop6
set_directive_pipeline -off fft1D_512/loop7
set_directive_pipeline -off fft1D_512/loop8
set_directive_pipeline -off fft1D_512/loop9
set_directive_pipeline -off fft1D_512/loop10
set_directive_pipeline -off fft1D_512/loop11
set_directive_pipeline -off twiddles8/twiddles
set_directive_pipeline -off fft1D_512
set_directive_pipeline -off twiddles8
set_directive_pipeline -off loadx8
set_directive_pipeline -off loady8
set_directive_inline -off twiddles8
set_directive_inline -off loadx8
set_directive_inline -off loady8
set_directive_array_partition -off fft1D_512 reversed
set_directive_array_partition -off fft1D_512 data_x
set_directive_array_partition -off fft1D_512 data_y