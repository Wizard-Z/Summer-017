/*this script finds the highest sale of the respective store and displays the store name and the maxsale value.
using simple foreach makes the problem very easy just 4 lines but we want to display which product had the maximum sale for that store.
one way is to use join which i know at the moment other is by using nested foreach.
Anyways this script simply calculate the top sale of each store */
data = load 'purchases.txt' as (date, time, stores, product, cost:double, payment);
a = foreach data generate stores, product, cost;
b = group a by stores;
high = foreach b generate group, MAX(a.cost);
store high into 'Pig/outdir/topsale';

-- OUTPUT of this script is not uploaded.. NR


