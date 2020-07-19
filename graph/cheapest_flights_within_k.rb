INF = Float::INFINITY
def find_cheapest_price(n, flights, src, dst, k)
  graph = create_graph(flights)
  puts graph
  level = 0
  q = Queue.new
  cost_arr = Array.new(n, INF)
  cost_arr[src] = 0
  q.enq([src, 0])
  res = INF

  while((not q.empty?) && level <= k)
    city, cost = q.deq

    graph[city].each do |pair|
      next_city, next_cost = pair
      fair = cost + next_cost

      if next_city == dst && res > fair
        res = fair
      end

      if cost_arr[next_city] > fair
        cost_arr[next_city] = fair
        q.enq([next_city, fair]) if next_city != dst
      end
    end
    level += 1
  end

  res == INF ? -1 : res
end

def create_graph(flights)
  graph = Hash.new([])
  flights.each do |flight|
    src, dst, cost = flight
    graph[src] += [[dst, cost]]
  end
  graph
end

n = 3; flights = [[0,1,100],[1,2,100],[0,2,500]]
src = 0; dst = 2; k = 0

puts find_cheapest_price(n, flights, src, dst, k)


# def find_cheapest_price(n, flights, src, dst, k)
#   graph = create_graph(n, flights)
#
#   fun(graph, src, dst, k+1, n)
# end
#
# def fun(graph, src, dst, k, n)
#   if src == dst || (k == 0 && src == dst)
#     return 0
#   end
#
#   if k < 0
#     return -1
#   end
#
#   res = Float::MAX
#
#   for i in 0...n
#     if graph[src][i] != -1
#       l_res = fun(graph, i, dst, k-1, n)
#       if l_res != -1 && l_res != Float::MAX
#         res = [res, (l_res + graph[src][i])].min
#       end
#     end
#   end
#   res
# end
#
# def create_graph(n, flights)
#   graph = Array.new(n) {Array.new(n, -1)}
#   flights.each do |flight|
#     v,u,w = flight
#     graph[v][u] = w
#   end
#   graph
# end





