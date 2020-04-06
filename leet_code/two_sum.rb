def two_sum(nums, target)
    hsh = Hash.new
    i = 0; n = nums.length
    while(i < n)
        complement = target - nums[i]
        if hsh[complement]
            return [hsh[complement], i]
        end 
        hsh[nums[i]] = i
        i += 1
    end
    [-1, -1]
end