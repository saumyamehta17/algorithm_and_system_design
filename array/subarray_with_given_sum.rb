# ex - 1
# @arr = [1, 4, 20, 3, 10, 5]
# @sum = 33

@arr = [2, 5, 4, 3, 1, 6, 9]
@sum = 8

# ex - 2
# @arr = [1, 4, 0, 0, 3, 10, 5]
# @sum = 7

# ex - 3
# @arr = [1,4]
# @sum = 0


@start = 0; @end = 0; @len = @arr.length; @max_sum = @arr[0]
# this will work for positive numbers only
def find_range

1.upto(@len-1).each do |x|
  break if @max_sum >= @sum
  @max_sum += @arr[x]
  @end = x
end  

while(@start < @len && @end >= @start)
  if(@sum == @max_sum)
    print "subarray range is #{@start} to #{@end}"
    return 
  elsif @max_sum > @sum
    @max_sum -= @arr[@start]
    @start += 1
  elsif @max_sum < @sum
    @end += 1
    @max_sum += @arr[@end]
  end  
end  

print 'No Sub Array found...'

end

def get_range_for_negative_also(arr, sum)
  i = 0; hsh = {}
  len = arr.length
  curr_sum = 0
  while(i < len)
    curr_sum += arr[i]

    if(curr_sum == sum)
      puts "subarray range is from 0 to #{i}"
      return
    end

    if(hsh[curr_sum - sum])  
      puts "subarray range is from #{hsh[curr_sum - sum]+1} to #{i}"
      return
    end

    hsh[curr_sum] = i
    i += 1
  end

  puts "No sub array..."  
end  

# find_range
get_range_for_negative_also([1,4,20,3,10,5], 33)