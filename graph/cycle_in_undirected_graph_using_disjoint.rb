Node = Struct.new(:data, :rank, :parent)

class Adjacent
  attr_reader :list

  def initialize
    @list = []
  end
end

class Graph
  attr_reader :vc, :array, :node_hsh, :edges

  def initialize(vc)
    @vc = vc
    @array = Array.new(vc) {Adjacent.new}
    @edges = []
    @node_hsh = {}
  end

  def add_edge(src, dest)
    edges << [src, dest]
    array[src].list << dest if !array[src].list.include?(dest)
    array[dest].list << src if !array[dest].list.include?(src)
  end

  def have_cycle
    build_sets

    edges.each do |edge|
      node1 = node_hsh[edge[0]]
      node2 = node_hsh[edge[1]]

      parent1 = find_set(node1)
      parent2 = find_set(node2)

      if(parent1.data == parent2.data)
        return true
      end

      union(parent1, parent2)  
    end
    return false  
  end  

  def build_sets
    vc.times do |i|
      make_set(i)
    end  
  end  

  def make_set(data)
    node = Node.new
    node.data = data
    node.rank = 0
    node.parent = node
    node_hsh[data] = node
  end 

  def union(node1, node2)
    rank1 = node1.rank
    rank2 = node2.rank

    if rank1 >= rank2
      node1.rank =  rank1 == rank2 ? rank1 + 1 : rank1
      node2.parent = node1
    else
      node2.rank += 1
      node1.parent = node2
    end  
  end

  def find_set(node)
    parent = node.parent
    if(node.data == parent.data)
      return parent
    end
    
    node.parent = find_set(node.parent)
    return node.parent
  end 

end  

graph = Graph.new(4)
graph.add_edge(0,1)
graph.add_edge(0,2)
graph.add_edge(1,2)
graph.add_edge(2,3)
puts graph.edges.to_s
puts graph.have_cycle