--This script calculate the sale done on specific day of the week for the complete year
-- Uses purchases.txt as the input data
-- this script same can be used to find the most loved item brought or which item are brought at a particular day of the week max. most popular item

data = load 'purchases.txt' as (date, time, stores, product, cost, payment);
define mapday `weekendmap.py` ship('weekendmap.py');
-- ship the .py file to filter the data and attach daynumber to it.
fltr_data = stream data through mapday as (date:int, cost:double);
fltr = filter fltr_data by (chararray)date matches '6';
sundaysale = group fltr by date;
-- here the fltr already contains the data only for sunday, group is optional but we want to calculate mean so if we have a bag we can easily provide it for calculation
mn = foreach sundaysale generate SUM(fltr.cost)/COUNT(fltr);
-- calculates mean in just one line not to mention the backend process which split the file etc ....
store mn into 'outdir/mean_sale_on_sunday';




