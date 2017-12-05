# ex - 1
@arr = [1, 4, 20, 3, 10, 5]
@sum = 33

# ex - 2
# @arr = [1, 4, 0, 0, 3, 10, 5]
# @sum = 7

# ex - 3
# @arr = [1,4]
# @sum = 0


@start = 0; @end = 0; @len = @arr.length; @max_sum = @arr[0]

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
    @max_sum += @arr[@end]
    @end -= 1
  end  
end  

print 'No Sub Array found...'

end

find_range