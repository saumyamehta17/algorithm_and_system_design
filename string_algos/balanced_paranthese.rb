# Check for balanced parentheses in an expression
# {()}[] is balanced
# {}(] is unbalanced
# consider (,),{,},[,]

def is_balanced?(str)
  len = str.length
  i = 0
  s1 = []
  while(i < len)
    if(str[i] == '[' || str[i] == '(' || str[i] == '{')
      s1.push(str[i])
    else
      if(s1.empty?)
        return false
      else
        exp = s1.pop
        if((str[i] == ']' && exp == '[') || 
           (str[i] == '}' && exp == '{') || 
           (str[i] == ')' && exp == '('))
          # Nothing..
        else
          return false
        end
      end  
    end
    i += 1
  end  
  return s1.length == 0  
end  

# str = '{()}[]'
str = '{()}]'
puts is_balanced?(str)
