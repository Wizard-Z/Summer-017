--This script strips the body from the forum post file and then splits the body based on words and words appearing on each node_id
-- for this the script is written below;
data = load 'forum_node.tsv';
define sp `split.py` ship('split.py');--split the words from the body and replacing the tags and substitution for more detail just see the script
-- for simplicity here main concern is the word 
a = stream data through sp as(word:chararray, node_id:long);
--b = group a by node_id;
c = group a by word;
countt = foreach c generate group, COUNT(a) as count_word;--count of each word which have been used in forum 
tempp = filter countt by group matches 'fantastic*';
-- change path according to the need
-- store output in seprate directories
store tempp into 'Pig/outdir/countfantastic';
ids = foreach c generate group as wrd, a.node_id as id;
fltr_ids = filter ids by wrd matches 'outdir/fantastically';
store fltr_ids into 'outdir/nodecount';

-- output will be saved in the file named part-r-00000 under the specified directories !!

