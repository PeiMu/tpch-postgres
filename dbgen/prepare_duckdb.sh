# compile the correct DuckDB version

if [ -z "$1" ]; then
  echo "Please enter scale factor to choose the correct database!"
  exit 1
fi

rm -f ./tpch_$1.db
csv_dir=out_$1/csv

# create schema
echo "create tpch schema"
echo -ne ".read dss.ddl" | duckdb ./tpch_$1.db

# load tpch
for table in NATION REGION PART SUPPLIER PARTSUPP CUSTOMER ORDERS LINEITEM
do
  echo "duckdb load table from ${table}.tbl"
  command="copy ${table} from '${PWD}/${csv_dir}/${table}.csv' (quote '\"', escape '\\');"
  echo $command
  echo -ne "${command}" | duckdb ./tpch_$1.db
done
