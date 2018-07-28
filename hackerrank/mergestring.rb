

a = 'zbxnsjdns'
b = 'idowdk'
# a = "abc"
  
# b = "stuvwx"
len1 = a.length
len2 = b.length
c = b
if len1 > len2
  # temp = a
  # a = b
  # b = temp
  c = a
  temp = len1
  len1 = len2
  len2 = temp
end
ms = ""
for i in 0...len1
  ms += a[i]
  ms += b[i]
end  
for i in len1...len2
  ms += c[i]
end  

puts ms

