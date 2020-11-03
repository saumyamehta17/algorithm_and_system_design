def solution(t)
  graph = build_graph(t)
  visited = Array.new(t, false)
  start = 0
  q = Queue.new
  q.enq([start, 0])
  max_path = 0
  while(!q.empty?)
    source, path = q.deq
    max_path = path if path > max_path
    visited[source] = true

    graph[source].each do |v|
      next if visited[v]
      q.enq([v, path+1])
    end
  end

  max_path
end

def build_graph(t)
  graph = {}
  1.upto(t.length-1).each do |v|
    graph[v] ||= []
    graph[v] << t[v]
    adjacent_vertex = t[v]
    graph[adjacent_vertex] ||= []
    graph[adjacent_vertex] << v
  end
  graph
end

t = [0,9,0,2,6,8,0,8,3,0]
solution(t)