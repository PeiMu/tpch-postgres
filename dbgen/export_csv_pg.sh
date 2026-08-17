#!/bin/bash

if [ -z "$1" ]; then
  echo "Please enter scale factor to choose the correct database!"
  exit 1
fi

csv_dir=out_$1/csv
rm -rf ${csv_dir}
mkdir -p ${csv_dir}

for table in NATION REGION PART SUPPLIER PARTSUPP CUSTOMER ORDERS LINEITEM
do
  psql -U tpch -d tpch -c "\\copy ${table} to '${PWD}/${csv_dir}/${table}.csv' csv";
done

echo "Finish exporting to csv files in ${csv_dir}!!!"
