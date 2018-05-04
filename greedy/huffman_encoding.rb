# Lossless Data Compression Algo
Node = Struct.new(:data, :c, :left, :right)
class HuffmanEncoding
  attr_reader :min_heap, :input

  def initialize(input)
    @input = input
    @min_heap = []
  end

  def fill
    for x in 0...(input.length)
      min_heap << Node.new(input[x][1], input[x][0])
      indx = min_heap.length - 1
      while(indx != 0)
        parent = (indx-1)/2
        if(min_heap[parent].data < min_heap[indx].data)
          break
        else
          heapify(parent)
          indx = parent
        end  
      end  
    end  
  end

  def process
    while(min_heap.length > 1)
      node1 = extract
      node2 = extract

      new_data = (node1.data + node2.data)
      node = Node.new(new_data)
      node.left = node1
      node.right = node2
      min_heap.push(node)
      heapify(min_heap.length-1)
    end  
  end  

  def print_codes(node, s = '')
    if node.left.nil? && node.right.nil?
      puts "#{node.c} --> #{s}"
    end  

    print_codes(node.left, s + '0') if node.left
    print_codes(node.right, s + '1') if node.right
  end  

  def heapify(indx)
    n = min_heap.length
    smallest = indx
    lindx = indx*2+1
    rindx = indx*2+2

    if(lindx < n && min_heap[lindx].data < min_heap[smallest].data)
      smallest = lindx
    end
    
    if(rindx < n && min_heap[rindx].data < min_heap[smallest].data)
      smallest = rindx
    end

    if indx != smallest
      temp = min_heap[indx]
      min_heap[indx] = min_heap[smallest]
      min_heap[smallest] = temp
      heapify(indx)
    else
      return  
    end  
  end 


  def extract
    n = min_heap.length
    node = min_heap[0]
    min_heap[0] = min_heap[n-1]
    min_heap.pop
    heapify(0)
    puts min_heap.to_s
    node
  end 
end  


input = [['a',5],['b',9],['c',12],['d',13],['e',16],['f',45]]
# ,['e',16],['f',45]
hc = HuffmanEncoding.new(input)
hc.fill
# puts hc.min_heap.to_s
hc.process
# puts hc.min_heap.to_s
# hc.print_codes(hc.min_heap[0])