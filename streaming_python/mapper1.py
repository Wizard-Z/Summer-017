#!/home/sourabh/anaconda3/bin/python
"""
Top Tags
This script is for seeing what are the top tags that are used in posts.
this is a mapper script
This returns after reading data tags seprated along with their count.

"""

import sys
import csv

def mapper(stdin):
    """ MapReduce Mapper. """
    reader = csv.reader(stdin, delimiter='\t')
    # Skip header.
    reader.next()
    writer = \
           csv.writer(
               sys.stdout, delimiter='\t', quotechar='"', quoting=csv.QUOTE_ALL)

    for line in reader:
        if len(line) == 19:
            node_type = line[5]
            if node_type == "question":
                tagnames_str = line[2]
                tagnames = tagnames_str.split()
                for tagname in tagnames:
                    writer.writerow([tagname, "1"])

if __name__ == "__main__":
    mapper(sys.stdin)
