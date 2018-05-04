def special_keyboard(n)

  s = Array.new(n,0)

  for x in 1..6
    s[x-1] = x
  end

  for x in 7..n

    for y in (x-3).downto(1)
      val = (x-y-1) * s[y-1]
      s[x-1] = [s[x-1], val].max
    end  

  end  

  for x in 0...s.length
    puts "for #{x+1} optima length is #{s[x]}"
  end  

end

n = 11
special_keyboard(n)


# def special_keyboard(n)
#   return n if n <= 6
#   max = 0
#   for x in (n-3).downto(1)
#     curr = (n-x-1)*special_keyboard(x)
#     max = [max,curr].max
#   end  

#   max
# end


# def special_keyboard_v2(n, sol)
#   for x in 0...sol.length
#     sol[x] = x+1
#   end  

#   if n <= 6
#     sol[n-1] = n
#     return
#   end  
  
#   for x in 7..n
#     for y in (x-3).downto(1)
#       curr = (x-y-1) * sol[y-1]
#       sol[x-1] = [sol[x-1], curr].max
#     end  
#   end  
# end  
# n = 11
# sol = Array.new(n)
# special_keyboard_v2(n, sol)
# puts sol.to_s