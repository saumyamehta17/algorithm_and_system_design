# naive
def remove_dups_using_loops(str)
  n = str.length

  return if n <= 1

  indx = 0
  for i in 0...n
    for j in 0..i

      if(str[i] == str[j])
        break
      end

    end    

    if(i == j)
      str[indx] = str[i]
      indx += 1
    end
  end


    # remove extra chars
  puts str.slice(0...indx)    
end  
# sort can also be used
# ---
# using hasing
def remove_dups(str)
  n = str.length
  i = 0
  hsh = {}
  while(i < n)
    hsh[str[i]] = hsh[str[i]] ? hsh[str[i]] + 1 : 1
    i += 1
  end

  hsh.each do |k,v|
    puts k
  end  
end  

# str = "geeks for geeks"
# remove_dups(str)
str = "saumya"
remove_dups_using_loops(str)