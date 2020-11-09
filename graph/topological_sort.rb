require 'set'
def topological_sort(graph)
  vertices = graph.keys
  visited = Set.new
  stack = []
  for i in 0...vertices.length
    v = vertices[i]
    explore(v, visited, stack, graph) unless visited.include?(v)
  end

  while(!stack.empty?)
    print " #{stack.pop} "
  end
end

def explore(v, visited, stack, graph)
  visited.add(v)
  (graph[v] || []).each do |a|
    explore(a, visited, stack, graph) unless visited.include?(a)
  end
  stack.push(v)
end

directed_graph = {5 => [2,0], 4 => [0,1], 2 => [3], 3 => [1]}
topological_sort(directed_graph)