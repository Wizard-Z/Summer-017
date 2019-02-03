/*this script loads the purchases.txt and find the total sales accross the stores of all the products accross the various stores */
data = load 'purchases.txt' as (date, time, stores, product, cost:double, payment);
a = foreach data generate date, time, cost;
b = group a all;
c = foreach b generate COUNT(a) ,SUM(a.cost);
store c into 'Pig/outdir/totalsales';

-- These simple scripts do not require any further explanation.. Their outputs where also not uploaded. 


