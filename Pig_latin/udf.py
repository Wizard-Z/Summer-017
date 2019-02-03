@outputSchema('time:{(hr:chararray)}')#It can be confusing when specifying this structure because you only need to define what one element in the bag would look like.
def gettime(data,item_no):
  hours = []
  hrs = {}
  time = []
  for i in range(item_no):
    h = data[i][1]
    hours.append(h)
  for h in hours:
    hrs[h] = hrs.get(h,0) + 1
  active = sorted(hrs.values(), reverse = True)[0]
  for k,v in hrs.items() :
    if v == active :
      time.append(k)
  return time
  

    
