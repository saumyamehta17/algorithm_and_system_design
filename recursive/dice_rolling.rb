# n is the target to acheive by rolling the dice k times
def dice(n,k)
  if n == 0 && k == 0
    @c += 1
    return true
  elsif n <= 0 || k <= 0
    return false
  end
  
  for x in 1..6
    # dice(n-x, k-1)
    if dice(n-x, k-1)
      break
    end  
  end  
end

n = 4
k = 2
@c = 0
dice(n,k)  
puts @c
