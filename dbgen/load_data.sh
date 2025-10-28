for table in customer lineitem nation orders partsupp part region supplier
do psql -U tpch -d tpch -c \
        "\copy "$table"     from '$PWD/out/$table.tbl'        DELIMITER '|' CSV;"
done

