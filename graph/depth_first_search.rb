# Time complexity is o(v+e)
class GraphList
  attr_accessor :adjacents

  def initialize()
    @adjacents = []
  end
end  
class Graph
  attr_accessor :vertices_count, :list

  def initialize(vertices_count)
    @vertices_count = vertices_count
    @list = Array.new(vertices_count)
  end

  def self.build(vc)
    g = Graph.new(vc)
    vc.times.each do |x|
      g.list[x] = GraphList.new
    end
    g  
  end

  def add_edge(src, dest)
    @list[src].adjacents << dest unless @list[src].adjacents.include?(dest)
    @list[dest].adjacents << src unless @list[dest].adjacents.include?(src)
  end

  def print_it
    (0...list.length).each do |x|
      puts "#{x} -> #{list[x].adjacents.join(',')}"
    end  
  end  

  def dfs(start_from)
    visited = Array.new(vertices_count, 0)
    dfs = []
    dfs.push(start_from)
    visited[start_from] = 1

    while(!dfs.empty?)
      node = dfs.pop
      puts node
      adjacents = list[node].adjacents
      adjacents.each do |a|
        if visited[a] == 0
          dfs.push(a)
          visited[a] = 1
        end  
      end  
    end  
    
  end


  def dfs_using_recursion(v, visited_arr)  
    puts v
    visited_arr[v] = true
    adjacents = list[v].adjacents
    adjacents.each do |a|
      if(!visited_arr[a])
        visited_arr[a] = true
        dfs_using_recursion(a, visited_arr)
      end  
    end  
  end  
end  

g = Graph.build(5)
g.add_edge(0,1)
g.add_edge(0,2)
g.add_edge(1,2)
g.add_edge(2,0)
g.add_edge(2,3)
g.add_edge(3,3)
g.add_edge(3,4)

# g.print_it
g.dfs(2)
puts "--------------"
g.dfs_using_recursion(2, Array.new(g.vertices_count, false))