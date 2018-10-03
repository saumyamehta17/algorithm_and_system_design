
def valid?(ip_add)
  ip_add.split('.').each do |i|
    if i.to_i <= 0 || i.to_i > 255
      return false
    end  

    if(ip_add[0].to_i == 0)
      return false
    end 
  end  
  true
end  

def gen_ip(str)
  n = str.length
  if n <= 3 || n > 12
    return "Not Possible"
  end  
  temp_str = str
  valid_ips = []

  for i in 0...(n-2)
    for j in (i+1)...(n-1)
      for k in (j+1)...(n)
        temp_str = temp_str[0,k] + '.' + temp_str[k,n]
        temp_str = temp_str[0,j] + '.' + temp_str[j,n+1]
        temp_str = temp_str[0,i] + '.' + temp_str[i,n+2]
        if valid?(temp_str)
          valid_ips << temp_str
        end
        temp_str = str  
      end
    end
  end

  puts valid_ips.to_s      
end  
str = '2555'
str = "12211"
# str = "25525511135"
gen_ip(str)