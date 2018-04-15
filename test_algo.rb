@m = 3
@n = 3
def num_of_paths(l,h)
  return 1 if(l == @m-1 && h == @n-1)
  return 0 if(l == @m || h == @n)

  num_of_paths(l+1, h) + num_of_paths(l, h+1)
end  

puts num_of_paths(0,0)