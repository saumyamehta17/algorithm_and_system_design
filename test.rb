require 'set'
def topological_sort(graph)
  vertices = graph.keys
  visited = Set.new
  s = []
  vertices.each do |v|
    helper(visited, s, v, graph) if !visited.include?(v)
  end

  while(!s.empty?)
    puts s.pop
  end
end

def helper(visited, s, v, graph)
  visited.add(v)
  (graph[v] || []).each do |a|
    helper(visited, s, a, graph) if !visited.include?(a)
  end
  s.push(v)
end
directed_graph = {5 => [2,0], 4 => [0,1], 2 => [3], 3 => [1]}
topological_sort(directed_graph)