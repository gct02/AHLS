#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <math.h>
#include <stdbool.h>

typedef struct BinOpInfo {
    uint32_t opID; 
    uint32_t opCode;
    uint32_t bitwidth;
    double numOccurs;
    double mean;
    double variance;
    double standardDev;
    double sumOfSquares;
    struct BinOpInfo* next;
} BinOpInfo;

BinOpInfo* ops = NULL;

void profOp(uint64_t opID, uint8_t opCode, double value, uint32_t bitwidth) {
    bool isNewOp = true;
    BinOpInfo* currentOp = ops;

    while (currentOp != NULL) {
        if (currentOp->opID != opID) {
            currentOp = currentOp->next;
            continue;
        }

        double oldNumOccurs = currentOp->numOccurs;
        double oldMean = currentOp->mean;
        double oldVariance = currentOp->variance;
        double newNumOccurs = oldNumOccurs + 1;
        double squaredValue;
        double newMean;
        double newVariance;
        
        squaredValue = pow(value, 2);
        newMean = oldMean + (value - oldMean) / newNumOccurs;
        newVariance = (oldVariance / newNumOccurs) * oldNumOccurs
                    + ((newMean - value) / newNumOccurs) * (newMean - value);
    
        currentOp->numOccurs = newNumOccurs; 
        currentOp->mean = newMean;
        currentOp->variance = newVariance;
        currentOp->standardDev = sqrt(newVariance);
        currentOp->sumOfSquares += squaredValue;
        
        isNewOp = false;
        break;
    }

    if (isNewOp) {
        BinOpInfo* newOp = malloc(sizeof(BinOpInfo));
        newOp->opID = (uint32_t)opID;
        newOp->opCode = opCode;
        newOp->bitwidth = bitwidth;
        newOp->numOccurs = 1;
        newOp->mean = value;
        newOp->sumOfSquares = pow(value, 2);
        newOp->variance = 0;
        newOp->standardDev = 0;
        newOp->next = ops;
        ops = newOp;   
    }
}

void saveProfile(const char *fileName) {
    int count = 0;
    BinOpInfo* nextOp;
    FILE* outputFile = fopen(fileName, "w");

    if (outputFile == NULL) {
        printf("Unable to open %s\n", fileName);
        return;
    }
    while (ops != NULL) { 
        fprintf(outputFile, "%"PRIu32"|%"PRIu32"|%"PRIu32"|%"PRIu32"|%lf|%lf|%lf|%lf\n", 
                ops->opID, ops->opCode, ops->bitwidth, (uint32_t)ops->numOccurs, 
                ops->mean, ops->variance, ops->standardDev, ops->sumOfSquares);
        nextOp = ops->next;
        free(ops);
        ops = nextOp;
        count++;
    }
    fclose(outputFile); 
}
