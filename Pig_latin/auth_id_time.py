#!/home/sourabh/anaconda3/bin/python

import sys,csv

def mapper():
  reader = csv.reader(sys.stdin, delimiter='\t')
  for line in reader:
    author_id = line[3]
    date_added = line[8]
    time = date_added[11:13]
    print(author_id, time, sep = '\t')
if __name__ == '__main__':
  mapper();
  
    
