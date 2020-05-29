class RearrangeChar
  attr_reader :max_heap, :prev_char, :prev_freq, :str, :output

  def initialize(str)
    @max_heap = []
    @prev_char = '#'
    @prev_freq = -1
    @str = str
    @output = ''
  end

  def process
    n = str.length
    i = 0
    char_arr = Array.new(26, 0)
    while(i < n)
      char_arr[str[i].ord - 'a'.ord] += 1
      i += 1
    end

    i = 0
    while(i < n)
      freq = char_arr[str[i].ord - 'a'.ord]
      if freq != 0
        insert(str[i], freq)
        char_arr[str[i].ord - 'a'.ord] = 0
      end
      i += 1
    end

    rearrange
  end

  def rearrange
    while(!max_heap.empty?)
      cur_elem = max_heap.first
      extract

      if(prev_freq > 0)
        insert(prev_char, prev_freq)
      end

      @output += cur_elem[0]
      @prev_char = cur_elem[0]
      @prev_freq = cur_elem[1] -= 1

    end

    puts "No Possible" if(prev_freq > 0)
  end

  def insert(char, freq)
    max_heap << [char, freq]
    indx = max_heap.length-1
    while(indx != 0)
      parent = (indx-1)/2
      if(max_heap[parent][1] < max_heap[indx][1])
        break
      else
        heapify(parent)
        indx = parent
      end
    end
  end

  def extract
    n = max_heap.length
    max_heap[0] = max_heap[n-1]
    max_heap.pop
    heapify(0)
  end

  def heapify(indx)
    n = max_heap.length
    largest = indx
    lindx = indx*2+1
    rindx = indx*2+2

    if(lindx < n && max_heap[lindx][1] > max_heap[largest][1])
      largest = lindx
    end

    if(rindx < n && max_heap[rindx][1] > max_heap[largest][1])
      largest = rindx
    end

    if(indx != largest)
      temp = max_heap[indx]
      max_heap[indx] = max_heap[largest]
      max_heap[largest] = temp
      heapify(indx)
    else
      return
    end
  end


end

str = 'aabb'
str = 'bbbaa'
str = 'geeksforgeeks'
str = 'tree'
# str = 'bbbb'
rc = RearrangeChar.new(str)
rc.process
puts rc.output