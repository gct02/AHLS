#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/csim/build/apcc_db_gabriel/387251718724235261847/jpeg2bmp.ld.bc ${1+"$@"}
