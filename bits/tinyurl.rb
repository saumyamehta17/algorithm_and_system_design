class TinyUrl
  # total 62 chars a-z, A-Z, 0-9
  POSSIBLE_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

  # id is taken from db corresponsing to long url
  # let id = 12345
  def get_shortcode(id)
    id = id.to_i
    code = ''
    while(id != 0)
      code += POSSIBLE_CHARS[(id % 62)]
      id = (id/62)
    end
    # code.reverse  
    code
  end

  def get_id_from_code(code)  
    len = code.length - 1
    n = 0
    len.downto(0).each do |x|
      n += POSSIBLE_CHARS.index(code[x]) * (62**x)
    end
    n  
  end  

end  

tu = TinyUrl.new
code = tu.get_shortcode('12345')
puts code
id = tu.get_id_from_code(code)
puts id