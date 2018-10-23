def detect_loop(head)
  slow_ptr = head
  fast_ptr = head.next.next
  while(slow_ptr != fast_ptr)
    puts slow_ptr.data
    puts fast_ptr.data
    break if fast_ptr.nil? || fast_ptr.next.nil? || fast_ptr.next.next.nil?
    slow_ptr = slow_ptr.next
    fast_ptr = fast_ptr.next.next
  end

  if slow_ptr == fast_ptr
    puts "Cycle detected at #{fast_ptr.data}"
    fast_ptr
  else
    puts "no Cycle"  
  end  
end  

def loop_starts_at(head)
  curr = head
  prev = detect_loop(head)
  fast_ptr = prev
  while(fast_ptr != curr)
    prev = fast_ptr
    fast_ptr = fast_ptr.next
    curr = curr.next
  end

  if fast_ptr == curr
    puts "Loop starts at #{fast_ptr.data}"
  end  
end  

Node = Struct.new(:data, :next)
node = Node.new(2)
node.next = Node.new(9)
node.next.next = Node.new(6)
node.next.next.next = Node.new(12)

node.next.next.next.next = node.next.next
# detect_loop(node)
loop_starts_at(node)
# def majority(arr)
#   indx = candidate(arr)
#   c = 0
#   if indx == -1
#     puts -1
#   end  

#   for i in 0...arr.length
#     if arr[indx] == arr[i]
#       c += 1
#     end  
#   end

#   if c > (arr.length)/2
#     puts arr[indx]
#   else
#     puts -1  
#   end  
# end  

# def candidate(arr)
#   c = 0
#   indx = 0
#   for i in 0...arr.length
#     if arr[indx] == arr[i]
#       c += 1
#     else
#       c -= 1
#     end

#     if c < 0
#       indx = i
#       c = 0
#     end  
#   end
#   c < 0 ? -1 : indx
# end  

# arr = [3,1,3,3,2]
# arr = [1,2,3]
# majority(arr)

# MAX_VALUE = 4611
# def sp(pos_x, pos_y, x, y, mtrx, m, n)
#   if not_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#     return MAX_VALUE
#   end

#   if pos_x == x && pos_y == y
#     return 0
#   end

#   if nothing_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#     return -1
#   else
#     return [#sp(pos_x-1, pos_y, x, y, mtrx, m, n) + 1,
#     sp(pos_x+1, pos_y, x, y, mtrx, m, n) + 1,
#     #sp(pos_x, pos_y-1, x, y, mtrx, m, n) + 1,
#     sp(pos_x, pos_y+1, x, y, mtrx, m, n) + 1].min
#   end
# end

# def not_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#   pos_x < 0 || pos_y < 0 || pos_x >= m || pos_y >= n || mtrx[pos_x][pos_y] == 0
# end  

# def nothing_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#   not_valid?(pos_x-1, pos_y, x, y, mtrx, m, n) &&
#   not_valid?(pos_x+1, pos_y, x, y, mtrx, m, n) &&
#   not_valid?(pos_x, pos_y-1, x, y, mtrx, m, n) &&
#   not_valid?(pos_x, pos_y+1, x, y, mtrx, m, n)
# end

# pos_x = 0  
# pos_y = 0
# x = 2
# y = 3
# m = 3
# n = 4
# mtrx = [[1,0,0,0], [1,1,0,1], [0,1,1,1]]
# puts sp(pos_x, pos_y, x, y, mtrx, m, n)


