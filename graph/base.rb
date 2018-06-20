require 'pry'
class GraphList
  attr_accessor :adjacents

  def initialize
    @adjacents = []
  end  
end

Edge = Struct.new(:src, :dst)
class Graph
  attr_accessor :array, :vertices_count, :edges

  def initialize(vertices_count)
    @vertices_count = vertices_count
    @array = Array.new(vertices_count)
    @edges = []
  end  

  def self.build(vertices_count)
    graph = Graph.new(vertices_count)

    (0..(vertices_count-1)).each do |x|
      graph.array[x] = GraphList.new
    end
    graph  
  end

  def add_edge(src, dest)
    @edges << Edge.new(src, dest)
    self.array[src].adjacents << dest unless self.array[src].adjacents.include?(dest)
    self.array[dest].adjacents << src unless self.array[dest].adjacents.include?(src)
  end  

  def print_it
    (0..(@vertices_count-1)).each do |v|
      puts "#{v}----#{array[v].adjacents.join(' -> ')}"
    end
  end 

end 
# vertices_count = 4
# graph = Graph.build(vertices_count) 
# graph.add_edge(0, 1);
# graph.add_edge(0, 2);
# graph.add_edge(1, 2);
# graph.add_edge(2, 0);
# graph.add_edge(2, 3);
# graph.add_edge(3, 3);

