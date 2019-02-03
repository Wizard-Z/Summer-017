#!/home/sourabh/anaconda3/bin/python

from datetime import datetime
import sys

def mapper():
  for line in sys.stdin:
    data = line.strip().split('\t')
    if len(data) == 6 :
      date, time, store,product, cost, payment = data
      weekday = datetime.strptime(date, "%Y-%m-%d").weekday()
      print(weekday,cost,sep = '\t')
      
if __name__ == '__main__':
  mapper()
