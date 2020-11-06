def is_cycle?(graph, visited, vertex = 'A', parent_vertex = -1)
  visited[vertex] = true
  graph[vertex].each do |adjacent_vertex|
    if visited[adjacent_vertex] && parent_vertex != adjacent_vertex
      return true
    end
    is_cycle?(graph, visited, adjacent_vertex, vertex) unless visited[adjacent_vertex]
  end
  false
end

no_cycle_graph = {'A' => ['B', 'C'], 'C' => ['A', 'D'], 'D' => ['C'], 'B' => ['A']}
cycle_graph = {'A' => ['B', 'C'], 'C' => ['A', 'D', 'B'], 'D' => ['C'], 'B' => ['A', 'C']}
visited = {'A' => false, 'B' => false, 'C' => false, 'D' => false }

[no_cycle_graph, cycle_graph].each do |graph|
  puts is_cycle?(graph, visited)
end
