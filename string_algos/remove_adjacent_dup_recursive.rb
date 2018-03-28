require 'pry'
@removed = ""
def remove(str, n)
  if(str.length == 1)
    @removed = ""
    return str
  end  

  substr = remove(str[1,n] ,n)
  puts "#rr #{@removed} and substr #{substr}"
  sb = substr[0] || ""
  if sb != str[0] && @removed == ""
    @removed = ""
    return str[0] + substr
  elsif sb == str[0] && @removed == ""
    @removed = sb
    return substr[1..-1] || ""
  elsif sb == str[0] && @removed != str[0]
    @removed = ""
    return str[0] + substr
  elsif sb != str[0] && @removed == str[0]
    @removed = sb
    return substr[1..-1] || ""
  end        
end


# str = "geeksforgeek"
str = "acaaabbbacdddd"
# str = "acaac"
n = str.length
puts remove(str, n)  