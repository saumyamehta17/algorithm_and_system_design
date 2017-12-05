# Find Missing Number in an array

# arr = [1,2,3,5]
# output is 4

@arr = [1,2,3,5]
@n = 5
@total_sum = 0
@given_sum = 0
def find_missing
  1.upto(@n).each do |x|
    @total_sum = @total_sum ^ x
  end

  @arr.each do |x|
    @given_sum = @given_sum ^ x
  end

  puts @given_sum ^ @total_sum  
end

find_missing
