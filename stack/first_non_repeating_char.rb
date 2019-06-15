require 'pry'
class Node
  attr_accessor :count, :index

  def initialize
    @count = 0
    @index = -1
  end
end  
class StringOpr
  attr_accessor :str, :arr, :len, :index

  def initialize(str)
    @str = str
    @len = str.length
    @arr = Array.new(127) {|e| Node.new}
    @index = Array.new(127, 256)
  end

  def first_non_repeating_chr
    # Improvements
    # 1. incrementing count every time will create new object and assign to it
    #  to avoid this we can use two string status "occured_once" and "multiple"
    # 2. use hash if strings are small and arrays for big strings
    #  if hsh[status_of_char]  is null then set with "occured_once"
    #  if hsh[status_of_char] is occured_once then set it with multiple
    # traverse string again and see first char whose status is occured_once
    
    0.upto(len-1) do |i|
      @arr[str[i].ord].count += 1
      @arr[str[i].ord].index = i
    end
    res = 461168607387903 #MAxVALUE
    arr.each do |elem|
      if(elem.count == 1)
        res = [res, elem.index].min
      end  
    end

    puts "first non repeating is #{str[res]}"
  end

  def kth_non_repeating_chr(k)
    0.upto(len-1).each do |i|
      @arr[str[i].ord].count += 1
      if(@arr[str[i].ord].count == 1)
        @index[str[i].ord] = i
      end  

      if(@arr[str[i].ord].count > 1)
        @index[str[i].ord] = 256
      end  
      @arr[str[i].ord].index = i
    end
    # sort index array will take o(1)
    res = index.sort[k-1]

    puts "puts kth non repeating char #{str[res]}"
  end  
end 

# obj = StringOpr.new('GeekszforGeeks')
obj = StringOpr.new('xxzbby')
obj.first_non_repeating_chr
# k = 1
# obj1 = StringOpr.new('GeekszforGeeks')
# obj1.kth_non_repeating_chr(k)