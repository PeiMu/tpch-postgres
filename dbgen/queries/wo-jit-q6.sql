-- $ID$
-- TPC-H/TPC-R Forecasting Revenue Change Query (Q6)
-- Functional Query Definition
-- Approved February 1998
SET max_parallel_workers_per_gather = 0;
SET jit = off;
--SET jit_dump_bitcode = on;
--SET jit_above_cost = 100000;  -- Force JIT for any query cost
--SET jit_optimize_above_cost = 500000;  -- Force optimization
--SET jit_inline_above_cost = 500000;    -- Force inlining
--SET jit_expressions = on;
--SET jit_tuple_deforming = on;
--SET log_statement = 'all';
-- EXPLAIN (ANALYZE, BUFFERS)
select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	l_shipdate >= date '1994-01-01'
	and l_shipdate < date '1994-01-01' + interval '1' year
	and l_discount between 0.06 - 0.01 and 0.06 + 0.01
	and l_quantity < 24;
