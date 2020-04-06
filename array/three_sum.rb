# Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? 
# Find all unique triplets in the array which gives the sum of zero
def three_sum(nums)
  n = nums.length
  result = []
  for i in 0...n-2
    req_sum = 0
    hsh = Hash.new
    curr_sum = req_sum - nums[i]
    
    for j in (i+1)...n
      num = curr_sum - nums[j]
      if hsh[num]
          elements = [nums[i], num, nums[j]].sort
          result << elements unless result.include?(elements)
      end
      hsh[nums[j]] = true
    end 
  end
  result
end

nums = [-1, 0, 1, 2, -1, -4]
# three_sum(nums)

def three_sum_with_sorting(nums)
  nums = nums.sort
  n = nums.length
  results = []
  puts nums.to_s
  for i in 0...n
    l = i+1
    r = n-1
    num = nums[i]
    while(l < r)
      sum = num + nums[l] + nums[r]
      if(sum == 0)
        elements = [num, nums[l], nums[r]].sort
        results << elements unless results.include?(elements)
        l += 1
        r -= 1
      elsif sum < 0
        l += 1
      else
        r -= 1
      end  
    end  
  end  
  results
end  


nums = [-2,0,1,1,2]
puts three_sum_with_sorting(nums).to_s