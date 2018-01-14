@str = 'GeeksforGeeks'
@len = @str.length
@count_arr = Array.new(256,0)
@inc = 1
def first_non_repeating_char
  # count array with count of each char
  0.upto(@len-1) do |x|
    ascii_val = @str[x].ord
    @count_arr[ascii_val] += 1
  end  

  @count_arr.each_with_index do |x,i|
    return i.chr if(x == 1)
  end  
end

def kth_non_repeating_char(k)
  # count array with count of each char
  0.upto(@len-1) do |x|
    ascii_val = @str[x].ord
    @count_arr[ascii_val] += 1
  end  

  @count_arr.each_with_index do |x,i|
    if(x == 1)
     if(@inc == k) 
      return i.chr 
     end
      @inc += 1
    end 
  end
  return "Not found" 
end  

# puts first_non_repeating_char  
puts kth_non_repeating_char(3)  