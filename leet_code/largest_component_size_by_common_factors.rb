Node = Struct.new(:data, :parent, :rank)

class DSU
  attr_accessor :data_hash

  def initialize
    @data_hash = {}
  end

  def make_set(data)
    node = Node.new(data)
    node.parent = node
    node.rank = 0
    @data_hash[data] = node
  end

  def union(data1, data2)
    node1 = data_hash[data1]
    node2 = data_hash[data2]

    parent1 = find_set(node1)
    parent2 = find_set(node2)

    if parent1.data == parent2.data
      return
    end

    rank1 = parent1.rank
    rank2 = parent2.rank

    if rank1 >= rank2
      parent2.parent = parent1
      parent1.rank += 1
      puts "#{parent1.data} <---- #{parent2.data}"
    else
      parent1.parent = parent2
      parent2.rank += 1
      puts "#{parent2.data} <---- #{parent1.data}"
    end


  end

  def find_set(node)
    if node.data == node.parent.data
      return node
    end

    find_set(node.parent)
  end
end

def largest_component_size(a)
  dsu = DSU.new
  a.each {|x| dsu.make_set(x)}

  factors_hsh = {}
  a.each {|x| factors_hsh[x] = find_common_factors(x, Set.new) }

  factors_hsh.each do |k,v|
    v.each do |i|
     dsu.make_set(i)
     dsu.union(k, i)
    end
  end

  a.each do |i|
    node = dsu.data_hash[i]
    puts dsu.find_set(node).data
  end
end

def find_common_factors(n, s)
  for i in 2...n
    if n % i == 0
      s.add(i)
      find_common_factors(n/i, s)
    end
  end
  return s
end

a = [4, 6, 15, 35]
require 'set'
largest_component_size(a)