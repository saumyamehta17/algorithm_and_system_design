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
    self.array[src].ajacents << dest unless self.array[src].ajacents.include?(dest)
    self.array[dest].ajacents << src unless self.array[dest].ajacents.include?(src)
  end  

  def print_it
    (0..(@vertices_count-1)).each do |v|
      puts "#{v}----#{array[v].ajacents.join(' -> ')}"
    end
  end  

  def breadth_first_search(start_from)
    puts "*********BFS starting from #{start_from}***********"

    visited = Array.new(vertices_count, 0) #all visited node will be 1 else 0
    queue = Queue.new
    queue.enq(start_from)
    visited[start_from] = 1
    while(!queue.empty?)
      node = queue.deq
      print node
      i = 0
      ajacents = array[node].ajacents
      while(i <= ajacents.count)
          if visited[i] == 0
            visited[i] = 1
            queue.enq(i)
          end  
          i += 1
      end  
    end  
    print visited
  end

  def depth_first_search(start_from)
    puts "*********DFS starting from #{start_from}***********"

    visited = Array.new(vertices_count, 0) #all visited node will be 1 else 0
    dfs = []
    dfs.push(start_from)
    print start_from
    visited[start_from] = 1
    ajacents = array[start_from].ajacents  
    while(!ajacents.empty?)
      node = ajacents[0] #random
      break if visited[node] == 1
      print node if visited[node] == 0
      visited[node] = 1
      dfs.push(node)
      ajacents = array[node].ajacents  
    end  
    while(!dfs.empty?)
      node = dfs.pop
      ajacents = array[node].ajacents  
      ajacents.each do |a|
        if visited[a] == 0
          print a 
          visited[1] == 1
        end  
      end  
    end  
  end  

end 
vertices_count = 4

graph = Graph.build(vertices_count) 
graph.add_edge(0, 1);
graph.add_edge(0, 2);
graph.add_edge(1, 2);
graph.add_edge(2, 0);
graph.add_edge(2, 3);
graph.add_edge(3, 3);

# graph.add_edge(0,1) #index, destination
# graph.add_edge(0,4)

# graph.add_edge(1,2)
# graph.add_edge(1,3)
# graph.add_edge(1,4)

# graph.add_edge(3,2)
# graph.add_edge(3,4)

# graph.print_it

# graph.breadth_first_search(2)
graph.depth_first_search(2)

