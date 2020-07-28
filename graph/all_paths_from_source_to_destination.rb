def all_paths_source_target(graph)
  res = []
  # visited = Array.new(graph.length-1, false)
  explore(graph, res,0,graph.length-1,[0])
  res
end

def explore(graph, res,s,d,path)
  if s == d #graph[s].include?(d)
    res << path
    return true
  end
  puts "s #{s}"
  # visited[s] = true
  graph[s].each do |v|
    puts "adj #{v}"
    explore(graph, res, v, d, path+[v]) #unless visited[v]
  end
end

graph = [[4,3,1],[3,2,4],[3],[4],[]]
puts all_paths_source_target(graph).to_s