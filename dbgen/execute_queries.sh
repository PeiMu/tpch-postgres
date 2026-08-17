#!/bin/bash

if [ -z "$1" ]; then
  echo "Please enter scale factor to choose the correct database!"
  exit 1
fi

dir="$PWD/out_$1/queries/"
iteration=1

rm -f result/*
mkdir -p result/

for i in $(eval echo {1.."${iteration}"}); do
  for sql in "${dir}"/*; do
    echo "execute ${sql}" 2>&1|tee -a tpch_${i}.txt;
    psql -U tpch -d tpch -f "${sql}" 2>&1|tee -a tpch_${i}.txt;
  done
done

mv tpch_* result/.
