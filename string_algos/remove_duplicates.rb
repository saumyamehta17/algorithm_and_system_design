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

str = "geeks for geeks"
remove_dups(str)