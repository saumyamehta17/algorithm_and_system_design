# print all combination of a string, 
# which can range from length 1 to length of string.
# two combination differs in ordering of their chars
# xy and yz are different
# xy and yx are same

# PIE page no 116
def comb(n, start = 0)

  for i in start...n
    @out += @in[i]
    puts @out
    comb(n, i+1)
    @out.chop!
  end  
end

@in = 'wxyz'  
@out = ''
comb(@in.length)