# Sort the content of the a file based on second field, e.g.
# Input file:
# @arr = 
# ["Jervie,12,M",
# "Jaimy,11,F",
# "Tony,23,M",
# "Janey,11,F"
# ]
# Output file:
# Jaimy,11,F
# Janey,11,F
# Jervie,12,M
# Tony,23,M

@arr = 
["Jervie,12,M",
"Jaimy,11,F",
"Tony,23,M",
"Janey,11,F"
]

lo = 0; hi = @arr.length - 1

def sort(lo, hi)
  if(lo < hi)
    pivot_index = process(lo, hi)
    sort(lo, pivot_index - 1)
    sort(pivot_index + 1, hi)
  end  
end

def process(lo, hi)
  pivot_elem = @arr[hi]
  i = 0; j = 0
  if(age_from(@arr[i]) <= age_from(pivot_elem))
    swap(i,j) unless i == j
    j += 1
  end
  i += 1    
end  

def age_from(elem)
  elem.scan(/\d+/).last.to_i
end  

def swap(indx1, indx2)
  tmp = @arr[indx1]
  @arr[indx1] = @arr[indx2]
  @arr[indx2] = tmp
end  

sort(lo, hi)