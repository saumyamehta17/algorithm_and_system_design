def vertx_with_min_distance(spl_set_arr, distance_arr, i, v)
  min = 4611; min_indx = -1
  for i in 0...v
    if !spl_set_arr[i] && distance_arr[i] < min
      min = distance_arr[i]
      min_indx = i
    end  
  end  

  min_indx
end  

def dijkstra(graph, src, v)
  infinit_val = 4611
  distance_arr = Array.new(v, infinit_val)
  spl_set_arr = Array.new(v, false)
  distance_arr[src] = 0
  for i in 0...v

      u = vertx_with_min_distance(spl_set_arr, distance_arr, i, v)
      spl_set_arr[u] = true
      for j in 0...v
        if graph[u][j] != 0 && distance_arr[u] != infinit_val &&
           (distance_arr[u] + graph[u][j]) < distance_arr[j]
           distance_arr[j] = distance_arr[u] + graph[u][j]
        end   
      end
  end


  puts distance_arr.to_s    
end  


graph = [[0, 4, 0, 0, 0, 0, 0, 8, 0],
         [4, 0, 8, 0, 0, 0, 0, 11, 0],
         [0, 8, 0, 7, 0, 4, 0, 0, 2],
         [0, 0, 7, 0, 9, 14, 0, 0, 0],
         [0, 0, 0, 9, 0, 10, 0, 0, 0],
         [0, 0, 4, 14, 10, 0, 2, 0, 0],
         [0, 0, 0, 0, 0, 2, 0, 1, 6],
         [8, 11, 0, 0, 0, 0, 1, 0, 7],
         [0, 0, 2, 0, 0, 0, 6, 7, 0]]
src = 0
v = 9
dijkstra(graph, src, v)