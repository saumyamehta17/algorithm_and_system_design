class DS
  attr_reader :arr, :size, :hsh

  def initialize
    @arr = Array.new
    @hsh = {}
    @size = -1 
  end

  def insert(val)
    if !hsh[val]
      @arr << val
      @size += 1
      @hsh[val] = size
      puts "Inserted #{val} at #{size} index"
    else
      puts "Already Exist"
    end  
  end

  def remove(val)
    if hsh[val]
      i = hsh[val]
      @arr[i] = arr[size]
      @arr.pop
      @size -= 1
      @hsh[val] = nil
      @hsh[arr[i]] = i
      puts "Removed #{val} now arr is #{arr.to_s}"
    else
      return "Not Exist"
    end  
  end 

  def search(val)
    puts "#{val} found at #{hsh[val]}"
  end

  def get_random
    i = rand(0..size)
    puts "Random elem is #{arr[i]}"
  end 
end  

ds = DS.new
ds.insert(10)
ds.insert(20)
ds.insert(30)
ds.insert(40)
ds.insert(40)
ds.remove(20)
ds.search(30)
ds.get_random
