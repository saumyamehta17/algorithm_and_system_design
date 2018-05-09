DLL = Struct.new(:data, :next, :prev)
hsh = {}

class LRU
  attr_reader :size, :dll, :hsh, :counter

  def initialize(size)
    @size = size
    @counter = 0
    @hsh = {}
    @dll = Node.new
  end

  def get(val)
    node = hsh[val]
    if node
      
    else
      if full

      end

      add_to_dll(val)
    end  
  end

  def add_to_dll(val)
  end  

  def full

  end  

  def exist?
  end
  
  def update_hash

  end

  def shuffle_recently_used(val)

  end  



end 

lru = LRU.new(3) 
lru.cache_write(1, 'A')
lru.cache_write(2, 'B')
