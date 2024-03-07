#!/bin/bash
ROOT="/home/sage/dfverifier"
for file in $ROOT/benchmarks/*
do
  if test -f $file
  then
    echo "+======= ${file##*/}  =======+"
    while read line || [[ -n ${line} ]]
    do
      echo $line
    done < $file
    echo ""
  fi
done
