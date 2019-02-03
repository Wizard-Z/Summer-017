/*This script results in showing top 3 sales of each consequetive stores */

data = load 'purchases.txt' as (date, time, stores:chararray, product:chararray, price:double, method:chararray);
grp_prd_str = group data by (stores, product);--this creates a bag names data having key as stores and product
grp_prd_str_cst = foreach grp_prd_str generate group.stores as stores, group.product as product, SUM(data.price) as price;
--this then calculates the sum of each price column in each bag as they are grouped by 2 keys so it makes it easy to calculate the total sales of each product of in a given stores with just one line syntax not to mention that jobs are pipelined;
--grp_prd_str_cst: {stores: chararray,product: chararray,price: double} this shows that now we have filter form of data where we have data according to our needs now for our convinient we can creates bag for each store
grpd1 = group grp_prd_str_cst by stores;
grpd = foreach grpd1 {
sorte = order grp_prd_str_cst by price desc;
top3 = limit sorte 3;
generate flatten(top3);
};
store grpd into 'outdir/top3sales';


