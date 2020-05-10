# n is the target to acheive by rolling the dice k times
def dice(n,k,f)
  # puts "enter in method #{n} #{k}"
  if n == 0 && k == 0
    @c += 1
    return true
  elsif n <= 0 || k <= 0
    return false
  end

  for x in 1..f
    # dice(n-x, k-1)
    # puts "dice(#{n-x}, #{k-1}, #{f})"

    if f*(k-1) >= (n-x) && dice(n-x, k-1, f)
      break
    end
  end
  false
end

def num_rolls_to_target(n,k,f)
  @c = 0
  dice(n,k,f)
  @c
end
n = 10
k = 2
f = 5

puts num_rolls_to_target(n,k,f)
