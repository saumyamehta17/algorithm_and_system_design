def sort(arr, low, hi)
  if low < hi
    pi = getPivot(arr, low, hi)
    sort(arr, low, pi-1)
    sort(arr, pi+1, hi)
  end  
end  

def getPivot(arr, low, hi)
  pivot = arr[hi]
  i = j = low
  while(i < hi)
    val1 = pivot.to_s + arr[i].to_s
    val2 = arr[i].to_s + pivot.to_s

    if _to_int(val2) > _to_int(val1)
      swap(arr, i, j) if i != j
      j += 1
    end
    i += 1  
  end

  swap(arr,i,j) if i != j
  j  
end

def swap(arr, i, j)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end

def _to_int(str)
  n = _length(str)
  sign = 1
  res = 0
  i = 0
  if str[i] == '-'
    sign = -1
    i += 1
  end  
  while(i < n)
    val = str[i].ord - '0'.ord
    res = res*10 + val
    i += 1
  end
  res * sign  
end  

def _length(str)
  i = 0
  while(!str[i].nil?)
    i += 1
  end  
  i
end 

def _to_string(number, base = 10)
  i = 0
  str = Array.new 
  if number == 0
    str[i] = '0'
    i += 1
    return str
  end  
  negative = false
  if number < 0
    negative = true
  end
  
  while(number > 0)
    rem = number % base
    str[i] = rem + 48 # 48.chr = '0'
    number = number / base
    i += 1
  end
  if negative
    str[i] = '-'
  end
  res = ''
  while(i >= 0)
    if !str[i].nil?
      res += str[i].chr
    end  
    i -= 1
  end  
  res
end

arr = [54,546,548,60]
puts arr.to_s
sort(arr, 0, 3)  
puts arr.to_s