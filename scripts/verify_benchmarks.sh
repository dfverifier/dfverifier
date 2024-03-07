#!/bin/bash
ROOT="/home/sage/dfverifier"
BIN=$ROOT/bin/dfverifier
for file in $ROOT/benchmarks/*
do
  if test -f $file
  then
    echo "+======= ${file##*/}  =======+"
    $BIN $file
  fi
done
