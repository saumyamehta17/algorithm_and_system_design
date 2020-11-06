# Plan a trip and visit as many cities as possible and does not want visit any city more than once
# He can visit only one odd-numbered city

class Node
  attr_accessor :val, :distance, :odd

  def initialize(val, distance = 1, odd = false)
    @val = val
    @distance = distance
    @odd = odd
  end
end

def solution(t)
  graph = build_graph(t)
  visited = Array.new(t.length, false)
  start = 0
  q = Queue.new
  q.enq(Node.new(start))
  max_path = 0
  while(!q.empty?)
    node = q.deq
    distance = node.distance
    odd = node.odd
    source = node.val

    max_path = distance if distance > max_path
    visited[source] = true
    graph[source].each do |v|
      next if visited[v] || (odd && v.odd?)
      q.enq(Node.new(v, distance+1, v.odd? || odd))
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
# t = [0,0,0,1,6,1,0,0]
puts solution(t)