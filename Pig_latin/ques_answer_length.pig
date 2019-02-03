/*to see question length of a user and its average answer length the data only has one question per id but more than one answer this is being taken care in the udfs and etc */
data = load 'student_test_posts.csv';
define filterd `id_body_type.py` ship('id_body_type.py');
register 'udf2.py' using jython as udf;
fltr = stream data through filterd as (id:int, body:int, type:int);
grpd = group fltr by id;
x = foreach grpd generate group as id, flatten(udf.getques_ans(fltr,COUNT(fltr)));
store x into 'outdir/question_answer_length';





