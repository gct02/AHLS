#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/csim/build/apcc_db_gabriel/385441718724226006114/jpeg_host.ld.bc ${1+"$@"}
