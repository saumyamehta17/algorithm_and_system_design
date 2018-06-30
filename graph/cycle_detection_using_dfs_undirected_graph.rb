require './base.rb'

vertices_count = 4
graph = Graph.build(vertices_count) 
graph.add_edge(0, 1);
graph.add_edge(0, 2);
graph.add_edge(1, 2);
# graph.add_edge(2, 0);
# graph.add_edge(2, 3);
graph.add_edge(3, 3);
# graph.print_it
puts graph.edges.to_s
Graph.class_eval do 
  # will take o(v+e) time complexity
  def detect_cycle_using_dfs(vertex, visited_arr, parent_vertex)
       visited_arr[vertex] = true
       adjacents = array[vertex].adjacents
       adjacents.each do |a|
         if !visited_arr[a]
           if detect_cycle_using_dfs(a, visited_arr, vertex)
            return true
           end 
         else
           if(a != parent_vertex)
             return true
           end 
         end

       end
       return false  
  end


  # will take o(e) time complexity  
  def detect_cycle_using_arr(edges)
    parent_arr = Array.new(vertices_count, -1)
    edges.each do |edge|

      x = find_subset(parent_arr, edge.src)
      y = find_subset(parent_arr, edge.dst)

      if (x == y)
        return true
      end

      union(parent_arr, x, y)
    end 
    return false 
  end

  def find_subset(parent_arr, vertex)
    if parent_arr[vertex] == -1
      return vertex
    end

    find_subset(parent_arr, parent_arr[vertex])

  end

  def union(parent_arr, x, y)
    x = find_subset(parent_arr, x)
    y = find_subset(parent_arr, y)

    if x < y
      parent_arr[x] = y
    else
      parent_arr[y] = x 
    end  
  end  

end  
visited_arr = Array.new(vertices_count, false)
parent = -1
starting_vertex = 0
# if graph.detect_cycle_using_dfs(starting_vertex, visited_arr, parent)
#   puts "Found Cycle"
# else
#   puts "No Cycle"
# end  

puts graph.detect_cycle_using_arr(graph.edges)