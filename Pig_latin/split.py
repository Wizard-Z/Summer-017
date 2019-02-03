#!/home/sourabh/anaconda3/bin/python
import sys,re
import csv, string
def mapper():
  reader = csv.reader(sys.stdin, delimiter='\t')
  for line in reader :
    body = line[4]
    node_id = line[0]
    fbody = re.findall(r'[\w]+',body)
    #words = fbody.strip().split()
    for word in fbody :
      print ('{}\t{}'.format(word.lower(),node_id))
      
if __name__ == '__main__':
  mapper()
    
