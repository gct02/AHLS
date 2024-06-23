#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/csim/build/apcc_db_gabriel/374391718834766341119/adpcm_host.ld.bc ${1+"$@"}
