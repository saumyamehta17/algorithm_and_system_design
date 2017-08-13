class PostFix
  attr_accessor :out
  def initialize(exp)
    @infix_exp = exp
  end  

  def convert
    @out = []
    opr_arr = []
    @infix_exp.length.each do |x|
      if x.is_operand?
        @out << x 
      else
        if opr_arr.empty? || x == '('
          opr_arr << x
        elsif x == ')'
          return -1 if opr_arr.empty?
          elem = opr_arr.pop
          while(!opr_arr.empty && elem != ')')
            elem = opr_arr.pop
          end
            
          # if precendece(x) > precendece(opr_arr.last)
          #   opr_arr << x
          # elsif precendece(x) < precendece(opr_arr.last)

            
                
        end  
      end  
    end  
  end  

  def is_operand?(char)
    ('a'..'z').include?(char) || ('A'..'Z').include?(char)
  end  

  def precendece(opr)
    case 
    when '+':
      return 1
    when '-':
      return 1
    when '*':
    when '/':
      return 2
    when '^':
      return 3
    else
     return -1     
    end  
  end  

end  