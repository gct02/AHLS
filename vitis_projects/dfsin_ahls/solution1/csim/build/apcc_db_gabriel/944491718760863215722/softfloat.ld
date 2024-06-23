#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/csim/build/apcc_db_gabriel/944491718760863215722/softfloat.ld.bc ${1+"$@"}
