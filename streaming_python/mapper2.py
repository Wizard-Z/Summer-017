#!/home/sourabh/anaconda3/bin/python
import sys
import csv

def mapper(stdin):
    """ MapReduce Mapper. """
    reader = csv.reader(stdin, delimiter='\t')
    # Skip header.
    reader.next()

    for line in reader:
        if len(line) == 19:
            author_id = line[3]
            added_at = line[8]
            # Sample added_at:
            # 2012-02-25 08:09:06.787181+00
            added_at = added_at.strip()
            hour = added_at[11:13]

            yield '%s\t%s\t%s' % (author_id, hour, 1)

if __name__ == "__main__":
    for output in mapper(sys.stdin):
        print output
