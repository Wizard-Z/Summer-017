/*Script to calculate the maximum active time of an user*/
define filterd `auth_id_time.py` ship('auth_id_time.py');
register 'udf.py' using jython as udf;
data = load 'forum_node.tsv';
fltrdata = stream data through filterd as (id, hours:int);
grp_data = group fltrdata by id;
result = foreach grp_data generate group as id, flatten(udf.gettime(fltrdata,COUNT(fltrdata)));
store result into 'outdir/max_active_hours';
