#!/bin/bash

dfg_folder="estimators/gat/dataset/graphs"

i=1
for bench in benchmarks/chstone/*; do
    if [ -d $bench ]; then
        echo "Preprocessing ${bench}"
        project_name=$(basename ${bench})
        if (( $i < 10 )) ; then
            dfg_file=${dfg_folder}/0${i}_${project_name}.txt
        else
            dfg_file=${dfg_folder}/${i}_${project_name}.txt
        fi
        i=$((i+1))
        python scripts/preprocess_hls_ir.py -ir ${bench}/ahls/ir/a.g.ld.5.gdce.bc -pj $project_name -o ${bench}/ahls -dfg $dfg_file
    fi
done

for bench in benchmarks/jianyicheng/*; do
    if [ -d $bench ]; then
        echo "Preprocessing ${bench}"
        project_name=$(basename ${bench})
        if (( $i < 10 )) ; then
            dfg_file=${dfg_folder}/0${i}_${project_name}.txt
        else
            dfg_file=${dfg_folder}/${i}_${project_name}.txt
        fi
        i=$((i+1))
        python scripts/preprocess_hls_ir.py -ir ${bench}/ahls/ir/a.g.ld.5.gdce.bc -pj $project_name -o ${bench}/ahls -dfg $dfg_file
    fi
done

for bench in benchmarks/rosetta/*; do
    if [ -d $bench ]; then
        echo "Preprocessing ${bench}"
        project_name=$(basename ${bench})
        if (( $i < 10 )) ; then
            dfg_file=${dfg_folder}/0${i}_${project_name}.txt
        else
            dfg_file=${dfg_folder}/${i}_${project_name}.txt
        fi
        i=$((i+1))
        python scripts/preprocess_hls_ir.py -ir ${bench}/ahls/ir/a.g.ld.5.gdce.bc -pj $project_name -o ${bench}/ahls -dfg $dfg_file
    fi
done
