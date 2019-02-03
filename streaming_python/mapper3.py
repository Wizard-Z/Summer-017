#!/home/sourabh/anaconda3/bin/python
"""

This job is to see if there is any correlation between the length of a post and the answers.

It should be able to distinguish between question and comment.

This is the mapper script for the job

it returns ID type of post and its length for the reducer .



"""

import sys
import csv

def mapper(stdin):
    """
    MapReduce Mapper.  Output is tab-delimited.  Each line gives the question
    ID, 0/1, question/answer, and body length.
    """
    reader = csv.reader(stdin, delimiter='\t')
    # Skip header.
    reader.next()
    writer \
        = csv.writer(
            sys.stdout, delimiter='\t', quotechar='"', quoting=csv.QUOTE_ALL)

    for line in reader:
        if len(line) == 19:
            the_id = line[0]
            body = line[4]
            node_type = line[5]
            if node_type == "question":
                writer.writerow([the_id, "0", "question", len(body)])
            elif node_type == "answer":
                parent_id = line[6]
                writer.writerow([parent_id, "1", "answer", len(body)])

if __name__ == "__main__":
    mapper(sys.stdin)
