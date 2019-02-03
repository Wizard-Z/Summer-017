/* This script reads the purchases.txt and then displays the total sale across the all stores of the respective product */
data = load 'purchases.txt' as (date, time, stores, product, cost, payment);
b = foreach data generate product, (double) cost;
c = group b by product;
d = foreach c generate group, SUM(b.cost);
store d into 'outdir/product_sals';





