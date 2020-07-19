# Hash will use extra space

# Following is using XOR and AND
# XOR is checking bit should come with occurences 1,4,7...
# AND is checking  number should not be present in twos while checking for ones and vice versa
def single_number(nums)
  ones = 0
  twos = 0
  nums.each do |n|
    ones = (ones^n)&(~twos)
    twos = (twos^n)&(~ones)
  end

  ones
end

# nums = [2,2,3,2]
# nums = [0,1,0,1,0,1,99]

# Following is using 32-bit array, and count 1's for each number
def single_number_32bit(nums)
  bits = 4
  arr = Array.new(bits, 0) # constant space

  for i in 0...bits
    nums.each do |num|
      n = (num >> i) & 1 # moving bit at most significant place, anding with 1 so that last bit will just give 1 or 0, because 1 is 0...00001
      arr[bits-i-1] += n
    end
    arr[bits-i-1] %= 3
  end

  result = 0
  puts arr.to_s
  for i in 0...bits
    result += (arr[i] << (bits-i-1))
  end
  result
end

# << operators which shift left
# 1 << 0, gives 1
# 1 << 1, gives 2
# 1 << 2, gives 4
# its like converting all 1's to decimal number using binary number system..

nums = [2,2,3,2]
# nums = [0,1,0,1,0,1,99]
puts single_number_32bit(nums)