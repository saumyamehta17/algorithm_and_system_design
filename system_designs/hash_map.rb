Node = Struct.new(:key, :value, :next)
class HashMap
  SIZE = 15
  POSSIBLE_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

  attr_reader :arr

  def initialize
    @arr = Array.new(SIZE)
  end

  def insert(key, value)
    indx = (hash_code(key) % SIZE)
    node = arr[indx]
    if node 
      node = find_key(node, key)
      if node.key == key
        node.value = value
      else  
        node.next = Node.new(key, value)  
        node = node.next
      end  
    else
      node = Node.new(key, value)  
    end
    arr[indx] = node  
  end
  
  def get(key) 
    indx = (hash_code(key) % SIZE)
    node = arr[indx]
    node = find_key(node, key)
    node && node.value
  end

  def find_key(node, key)
    return nil if node.nil?
    while(node.next)
      return node if node.key == key
      node = node.next
    end
    node
  end  

  def hash_code(key)
    len = key.length - 1
    n = 0
    len.downto(0).each do |i|
      n += POSSIBLE_CHARS.index(key[i])
    end  
    n
  end 
end  

hash_map = HashMap.new
hash_map.insert('Robert', 25)
hash_map.insert('Robert', 29)
hash_map.insert('Robe', 27)

puts hash_map.get('Robertt')
puts hash_map.get('Robe')
puts hash_map.get('Robert')