#include "dfsin.h"

#include "iolib/populate_io.h"

int main (int argc, char *argv[])
{
    float64 inputVector[N];
    float64 outputVector[N];

    populateInput(inputVector, argv[1]);

    for (int i = 0; i < N; i++)
	{
        outputVector[i] = local_sin(inputVector[i]);
	}

    populateOutput(outputVector, argv[2]);

    return 0;
}