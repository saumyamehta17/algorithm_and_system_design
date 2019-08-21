  class DLL
  attr_reader :head, :tail

  def add(node)
    if !head.nil?
      curr = head
      node.next = curr
      curr.prev = node  
    else
      @tail = node  
    end  
    @head = node
  end
  
  def remove(node = tail)
    curr = node
    return if node.nil?

    if node.prev.nil?
      # head case
      curr.next.prev = nil
      @head = curr.next
    elsif node.next.nil?  
      # tail case
      curr.prev.next = nil
      @tail = curr.prev
    else  
      # normal case
      curr.prev.next = curr.next
      curr.next.prev = curr.prev
    end  
  end

  # def remove_tail
  #   return if tail.nil?
  #   node = tail
  #   node.prev.next = nil
  #   @tail = node.prev
  # end  
end

class LL
  attr_reader :key, :data
  attr_accessor :next, :prev

  def initialize(key, data)
    @key, @data = key, data
  end
end  


class LRU
  attr_reader :size, :dll, :hsh, :counter

  def initialize(size)
    @size = size
    @counter = 0
    @hsh = {}
    @dll = DLL.new
  end

  def write(key, val)
    node = hsh[key]
    if node.nil?
      node = LL.new(key, val)
      hsh[key] = node
      if cache_full
        dll.remove
      end  
      dll.add(node)
      @counter += 1
    else
      dll.remove(node)
      dll.add(node)
    end
    hsh[key] = node
    node
  end

  def read(key)
    node = hsh[key]
    return nil if node.nil?
    dll.remove(node)
    dll.add(node)
    node.data
  end 

  def print
    puts "Cached Data: "
    curr = dll.head
    while(!curr.nil?)
      puts curr.data
      curr = curr.next
    end  
  end  

  def cache_full
    counter >= size
  end 

end 

lru = LRU.new(3) 
lru.write(1, 'A')
lru.write(2, 'B')
lru.write(3, 'C')
lru.write(4, 'D')
puts lru.print

puts "Reading cache key 3"
puts lru.read(3)
