# with uniq set taking number as much time as they occured in input

def combinational_sum(input, sum)
  l = []
  res = []
  i = 0
  solve(input.sort, input.length, res, sum, l, i)
  puts res.uniq
end  

def solve(input, n, res, sum, l, i)
  if(sum == 0)
    res << l.to_s
    return
  end

  start = i
  while(start < n)
    if(sum - input[start] < 0)
      return
    end  
    l.push(input[start])
    solve(input, n, res, sum - input[start], l, start+1)
    l.pop
    start += 1
  end
end


arr = [1,1,2,4,5,7,10]
# arr = [2,2,4]
sum = 8
combinational_sum(arr, sum)  
