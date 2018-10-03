def no_of_employess(_hash)
  _h = {}
  _hash.each do |k,v|

    if _h[v]
      _h[v] += 1
    else
      _h[v] = 1
    end  
  end
  _hash.each do |k,v|
    puts "#{k} #{_h[k.to_s] || 0}"
  end  
end  

_hash = {"A": "C", "B": "C", "C": "F", "D": "E", "E": "F", "F": "F"}
no_of_employess(_hash)