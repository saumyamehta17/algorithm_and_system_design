require 'pry'
def conse

   count = 0
   low = 1
   high = 2
   _sum = low + high
   while high <= (num / 2) + 1
       if _sum == num
           count += 1
           high += 1
           _sum += high
           _sum -= low
           low += 1
           next
       end
       if num > _sum
           high += 1
           _sum += high
       else
           _sum -= low
           low += 1
       end
   end
   return count




   count = 0
   l = 1
   while( l * (l + 1) < 2 * num)
       a = (1.0 * num - (l * (l + 1) ) / 2) / (l + 1)
       if (a - a.to_i == 0.0)
           count += 1
       end
       l += 1
   end
   return count 
