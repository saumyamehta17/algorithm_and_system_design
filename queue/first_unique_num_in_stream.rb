class FirstUnique

  def initialize(nums)
    @que = []
    @hsh = Hash.new
    nums.each {|num| add(num)}
  end


  def show_first_unique()
    @que.first || -1
  end


  def add(value)
    if @hsh[value].nil?
      @que.push(value)
      @hsh[value] = false
    else
      @hsh[value] = true
      remove_duplicates
    end
  end

  def remove_duplicates
    while(!@que.empty?)
      elem = @que.first
      break unless @hsh[elem]
      @que.shift if @hsh[elem]
    end
  end

end

# Your FirstUnique object will be instantiated and called as such:
# obj = FirstUnique.new(nums)
# param_1 = obj.show_first_unique()
# obj.add(value)