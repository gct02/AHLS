#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/csim/build/apcc_db_gabriel/376111718834772273273/adpcm.ld.bc ${1+"$@"}
