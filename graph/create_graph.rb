require 'pry'
class GraphList
  attr_accessor :ajacents

  def initialize
    @ajacents = []
  end  
end

class Graph
  attr_accessor :array, :vertices_count

  def initialize(vertices_count)
    @vertices_count = vertices_count
    @array = Array.new(vertices_count)
  end  

  def self.build(vertices_count)
    graph = Graph.new(vertices_count)

    (0..(vertices_count-1)).each do |x|
      graph.array[x] = GraphList.new
    end
    graph  
  end

  def add_edge(src, dest)
    self.array[src].ajacents << dest
    self.array[dest].ajacents << src
  end  

  def print_it
    (0..(@vertices_count-1)).each do |v|
      puts "#{v}----#{array[v].ajacents.join(' -> ')}"
    end
  end  

end 
vertices_count = 5

graph = Graph.build(vertices_count) 
graph.add_edge(0,1) #index, destination
graph.add_edge(0,4)

graph.add_edge(1,2)
graph.add_edge(1,3)
graph.add_edge(1,4)

graph.add_edge(3,2)
graph.add_edge(3,4)

graph.print_it

