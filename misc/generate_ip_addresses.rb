def gen_ip_address(str, n)

  if(n <= 3 || n > 12)
    return false
  end  

  valid_ips = []
  temp_str = str
  for i in 1...(n-2)
    for j in (i+1)...(n-1)
      for k in (j+1)...n
        temp_str = temp_str[0,k] + "." + temp_str[k,n]
        temp_str = temp_str[0,j] + "." + temp_str[j,n+1]
        temp_str = temp_str[0,i] + "." + temp_str[i,n+1]

        if(valid?(temp_str))
          valid_ips << temp_str
        end
        temp_str = str  
      end
    end
  end  
  valid_ips.to_s
end  

def valid?(ip_address)
  ip_address.split('.').each do |x|
    if (x.to_i <= 0 || x.to_i > 255)
      return false
    end

    if(ip_address[0].to_i == 0)
      return false
    end  
  end 
  true 
end  

str = "12211"
str = "25525511135"
n = str.length
puts gen_ip_address(str, n)