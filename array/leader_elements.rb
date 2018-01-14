# leader is an element where it is greater than all its right elements
# last elem will always be leader
def find_leaders(arr, size)
  leader = arr[size - 1]
  p leader

  # scan right to left
  # time complexity - o(n)
  # space - o(1)
  (size - 2).downto(0).each do |i|
    if(arr[i] > leader)
      leader = arr[i]
      p leader
    end  
  end  
end  

find_leaders([16, 17, 4, 3, 5, 2], 6)