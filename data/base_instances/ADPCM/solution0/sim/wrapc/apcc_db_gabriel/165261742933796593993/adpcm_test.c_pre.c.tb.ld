#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/ADPCM/solution0/sim/wrapc/apcc_db_gabriel/165261742933796593993/adpcm_test.c_pre.c.tb.ld.bc ${1+"$@"}
