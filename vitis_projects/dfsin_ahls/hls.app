<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" top="local_sin" name="dfsin_ahls">
    <files>
        <file name="../../../benchmarks/chstone/dfsin/src/dfsin_host.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../../benchmarks/chstone/dfsin/src/iolib/populate_io.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/dfsin/src/dfsin.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/dfsin/src/softfloat.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/dfsin/src/softfloat-macros" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/dfsin/src/softfloat-specialize" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/dfsin/src/SPARC-GCC.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/dfsin/src/milieu.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/inputs/training/in1.txt output.txt">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

