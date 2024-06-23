#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/csim/build/apcc_db_gabriel/387941718724239462621/jpeg_decode.ld.bc ${1+"$@"}
