#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/csim/build/apcc_db_gabriel/943831718760860067805/dfsin.ld.bc ${1+"$@"}
