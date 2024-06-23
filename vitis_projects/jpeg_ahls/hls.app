<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" top="jpeg2bmp" name="jpeg_ahls">
    <files>
        <file name="../../../benchmarks/chstone/jpeg/src/jpeg_host.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../../benchmarks/chstone/jpeg/src/iolib/populate_io.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/jpeg/src/jpeg2bmp.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/jpeg/src/jpeg_decode.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/jpeg/src/constants.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/inputs/training/inputVec1.txt output.txt">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

