class GraphList
  attr_accessor :adjacents

  def initialize
    @adjacents = []
  end

end  
class Graph
  attr_accessor :vertice_count, :array

  def initialize(vertice_count)
    @vertice_count = vertice_count
    @array = Array.new(vertice_count)
  end

  def self.build(vc)
    g = Graph.new(vc)
    vc.times.each do |v|
      g.array[v] = GraphList.new
    end  
    g
  end
  
  def add_edge(src, dest)
    @array[src].adjacents << dest unless @array[src].adjacents.include?(dest)
    @array[dest].adjacents << src unless @array[dest].adjacents.include?(src)
  end

  def print_it
    @array.each_with_index do |a, i|
      puts "#{i} => #{a.adjacents.join(',')}"
    end  
  end  

  def bfs(start_from)
    visited = Array.new(vertice_count, 0)
    q = Queue.new
    q.enq(start_from)
    visited[start_from] = 1
    while(!q.empty?)
      node = q.deq
      puts node
      adjacents = @array[node].adjacents
      adjacents.each do |a|
        if(visited[a] == 0)
          q.enq(a)
          visited[a] = 1
        end  
      end  
    end  
  end  


end

g = Graph.build(4)
# g.add_edge(0, 1)
# g.add_edge(0, 2)
# g.add_edge(1, 2)
# g.add_edge(2, 0)
# g.add_edge(2, 3)
# g.add_edge(3, 3)

g.add_edge(2,0)
g.add_edge(2,3)
g.add_edge(0,2)
g.add_edge(0,1)
g.add_edge(2,3)
g.add_edge(3,3)
g.print_it
g.bfs(2)