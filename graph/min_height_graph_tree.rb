def find_min_height_trees(n, edges)
  return n.times.to_a {|x| x} if n <= 2

  graph = build_graph(edges)
  puts graph
  # Find out Centroids(Centroids should not be more than 2)
  # add leaves to array(leaves which has only one adjacent)
  leaves = []
  n.times do |vertex|
    leaves << vertex if graph[vertex].length == 1
  end
  puts leaves.to_s
  #Trim leaves while reaching to centroids
  centroids = n
  while(centroids > 2)
    centroids -= leaves.length
    new_leaves = []
    while(!leaves.empty?)
      leaf = leaves.pop
      a = graph[leaf].first
      graph[a].delete(leaf)
      new_leaves << a if graph[a].length == 1
    end
    leaves = new_leaves
  end
  leaves
end

def build_graph(edges)
  graph = {}
  edges.each do |edge|
    v = edge[0]
    adjacent_vertex = edge[1]
    graph[v] ||= []
    graph[v] << adjacent_vertex
    graph[adjacent_vertex] ||= []
    graph[adjacent_vertex] << v
  end
  graph
end
edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]
n = 6

edges = [[1,0],[1,2],[1,3]]
n = 4
roots = find_min_height_trees(n, edges)
puts roots.to_s