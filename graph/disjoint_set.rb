# Disjoints set is a data structure which maintain a collection s1, s2, and so on.
# Two sets are disjoins if their interaction is nil. Every set has a representative which is one member of set.

# Disjoints set is a data structure which provides 3 operations - make sets, union, find sets

# make set is a operation which create a set with one element
# union take two diff set and merge them and create one

# Let's take an example
# At beginning we have 5 sets {1}, {2}, {3}, {4}, {5} nobody is friend
Node = Struct.new(:data, :rank, :parent)
class DisjointSet
  attr_reader :node_hash

  def initialize
    @node_hash = {}
  end

  def make_set(data)
    node = Node.new
    node.data = data
    node.parent = node
    node.rank = 0
    node_hash[data] = node
  end

  def union(data1, data2)
    node1 = node_hash[data1]
    node2 = node_hash[data2]

    parent1 = findset(node1)
    parent2 = findset(node2)

    if(parent1.data == parent2.data)
      return -1
    end

    rank1 = parent1.rank
    rank2 = parent2.rank

    if(rank1 >= rank2)
      parent1.rank = rank1 == rank2 ? rank1 + 1 : rank1
      parent2.parent = parent1
      return parent1.data
    else
      parent2.rank += 1
      parent1.parent = parent2
      return parent2.data
    end  
  end

  def findset(node)
    parent = node.parent
    if(node.data == parent.data)
      return parent
    end

    node.parent = findset(node.parent)
    return node.parent
  end

  def find_a_set(val)
    findset(node_hash[val]).data
  end
end


ds = DisjointSet.new
ds.make_set(1)
ds.make_set(2)
ds.make_set(3)
ds.make_set(4)
ds.make_set(5)
ds.make_set(6)
ds.make_set(7)

ds.union(1,2)
ds.union(2,3)
ds.union(4,5)
ds.union(6,7)
ds.union(5,6)
ds.union(3,7)

puts ds.find_a_set(1)
puts ds.find_a_set(2)
puts ds.find_a_set(3)
puts ds.find_a_set(4)
puts ds.find_a_set(5)
puts ds.find_a_set(6)
puts ds.find_a_set(7)