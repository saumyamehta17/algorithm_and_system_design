Node = Struct.new(:data, :curr_indx, :arr_indx, :len)
def ksortedarray(arr)
  k = arr.length
  minheap = []
  build_minheap(minheap, k, arr)
  len = get_max_len_out_of_arr(arr, k)
  result_arr = Array.new(len, 0)

  for i in 0...len
    node = extract(minheap, k)
    result_arr[i] = node.data

    if node.curr_indx + 1 < node.len
      curr_arr = arr[node.arr_indx]
      new_node = Node.new(curr_arr[node.curr_indx + 1],
                   node.curr_indx + 1,
                   node.arr_indx,
                   node.len)
      insert(minheap, new_node)
    end  
  end

  puts result_arr.to_s  
end  

def insert(minheap,node)
    minheap << node
    indx = minheap.length - 1
    while(indx != 0)
      parent = (indx - 1)/2

      if minheap[parent].data > minheap[indx].data
        temp = minheap[parent]
        minheap[parent] = minheap[indx]
        minheap[indx] = temp
        indx = parent
      else
       break  
      end  
    end
end  


def get_max_len_out_of_arr(arr, k)
  total_len = 0
  for i in 0...k
    total_len += arr[i].length
  end  
  total_len
end  

def build_minheap(minheap, k, arr)
  for i in 0...k
    _data = arr[i][0]
    _len = arr[i].length
    node = Node.new(_data, 0, i, _len)
    insert(minheap, node)
  end  
end


def extract(minheap, k)
  temp_node = minheap[0]
  len = minheap.length
  if len > 1
    minheap[0] = minheap[len - 1]
  end
  minheap.pop  
  heapify(minheap, 0, len-1) if len - 1 > 0
  temp_node
end  


def heapify(minheap, indx, k)
  smallest = indx
  lindx = indx * 2 + 1
  rindx = indx * 2 + 2

  if lindx < k && minheap[lindx].data < minheap[smallest].data
    smallest = lindx
  end
  
  if rindx < k && minheap[rindx].data < minheap[smallest].data
    smallest = rindx
  end

  if indx != smallest
    temp = minheap[smallest]
    minheap[smallest] =  minheap[indx]
    minheap[indx] = temp
    heapify(minheap, indx, k)
  end  

end  

arr = [
  [2,4,9],
  [1,5,10],
  [3,6,7,11,23]
]
ksortedarray(arr)