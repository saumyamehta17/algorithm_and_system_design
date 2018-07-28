Node = Struct.new(:data, :next, :prev)
class DLL
  attr_accessor :head, :tail, :hsh

  def initialize
    @head = nil
    @tail = nil
    @hsh = {} 
  end

  def insert(val, cal_cap, given_cap)
    return nil if hsh[val]
    if cal_cap < given_cap
      insert_into_dll(val)
    else
      remove
      insert_into_dll(val)
    end  
    true
  end  

  def insert_into_dll(val)
    node = Node.new(val)
    node.next = head
    head.prev = node if !head.nil?
    @head = node
    hsh[val] = head
    if tail.nil?
      @tail = node
    end  
  end  

  def remove
    prev = tail.prev
    prev.next = nil
    hsh[tail.data] = nil
    @tail = prev
  end  
end  


class PageFault
  attr_accessor :count, :cal_cap, :given_cap, :values, :len, :dll

  def initialize(given_cap)
    @given_cap = given_cap
    @cal_cap = 0
    @count = 0
    @values = [5, 0, 1, 3, 2, 4, 1, 0, 5]
    @len = 9
    @dll = DLL.new
  end

  def check
    for i in 0...len
      if dll.insert(values[i], cal_cap, given_cap)
        @cal_cap += 1
        @count += 1
      end  
    end  
  end  
end  

pf = PageFault.new(4)
pf.check
puts pf.count