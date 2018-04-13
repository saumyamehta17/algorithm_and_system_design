DT = Struct.new(:arr, :l, :h)

def sort(_d, l, h)
  pivot = _d.arr[h]
  i = j = l
  while(i < h)
    xy = (_d.arr[i].to_s + pivot.to_s).to_i
    yx = (pivot.to_s + _d.arr[i].to_s).to_i

    if(xy > yx)
      swap(_d,i,j) if i != j
      j += 1
    end
    i += 1  
  end
  swap(_d, i,j) if i != j
  j  
end5

def swap(_d, i,j)
  tmp = _d.arr[i]
  _d.arr[i] = _d.arr[j]
  _d.arr[j] = tmp
end  

def arrange(_d,l,h)
  if(l < h)

    pivot_index = sort(_d, l, h)

    arrange(_d, l, pivot_index-1)
    arrange(_d, pivot_index+1, h)
  end  
end

arr = [1, 34, 3, 98, 9, 76, 45, 4]
l = 0; h = 7
_d = DT.new(arr, l , h)
puts "Before---  " + _d.arr.to_s
arrange(_d, _d.l, _d.h)  
puts "After---   " + _d.arr.join