# require 'pry'
# class CS
#   attr_reader :target, :input, :len, :list, :res

#   def initialize(input, target)
#     @input = input
#     @target = target
#     @len = input.length
#     @res = []
#     @list = []
#   end

#   def cs_solution(start,sum)
#     return if(sum > target)
#     i = start
#     while(i < len)
#       sum += input[i]
#       @list << input[i]

#       if(sum == target)
#         @res << list.to_s
#         sum -= list.last
#         @list.pop
#         return
#       end
      
#       if(sum < target)
#         cs_solution(i, sum)
#       else
#       end  
#       sum -= list.last
#       @list.pop
#       i += 1
#     end  
#   end  
# end  

# # input = [2,4,6,8]
# # t = 8
# input = [2,4]
# input = [2,4,6,8]
# t = 8
# cs = CS.new(input, t)
# cs.cs_solution(0,0)
# puts cs.res.to_s
