def find_subarray(arr)
  maxlen = 0
  hsh = {}
  end_index = -1
  sum = 0
  n = arr.length

  for i in 0...n
    arr[i] = -1 if arr[i] == 0
  end

  for i in 0...n
    sum += arr[i]

    if sum == 0 && maxlen < (i+1)
      maxlen = i+1
      end_index = i
    end

    if hsh[sum]
      _len = i - hsh[sum]
      if _len > maxlen
        maxlen = _len
        end_index = i
      end
    else
      hsh[sum] = i
    end
  end

  if end_index == -1
    puts "No such subarray"
  else
    puts "#{end_index - maxlen + 1} to #{end_index}"
  end
end

arr = [0, 0, 1, 1, 0]
arr = [1, 0, 1, 1, 1, 0, 0]
arr = [1,1,1,1]
find_subarray(arr)