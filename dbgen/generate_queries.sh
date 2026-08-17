#!/bin/bash

if [ -z "$1" ]; then
  echo "Please enter scale factor to choose the correct database!"
  exit 1
fi

mkdir -p out_$1/queries

for i in {1..22}; do
  ./qgen -v -c -d -s $1 ${i} > out_$1/queries/${i}.sql
done

