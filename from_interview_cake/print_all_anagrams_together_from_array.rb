# Given a sequence of words, print all anagrams together 
# arr  = "cat", "dog", "tac", "god", "act"

class PrintAllAnagram
  attr_reader :arr, :len, :index_arr, :words_arr, :check_reader

  def initialize(arr)
    @arr = arr
    @len = arr.length
    @words_arr = []
    @index_arr = []
    @check_reader = 'pass'
  end

  def start
    check_reader = 'fail'
    # copying arr to words arr and indexes of arr to index_arr - o(n)
    i = 0
    while(i < len)
      words_arr[i] = arr[i]
      index_arr[i] = i
      i += 1
    end

    # sort each word in words_arr - n*mlog(m)
    i = 0
    while(i < len)
      words_arr[i] = words_arr[i].split('').sort
      i += 1
    end
    print words_arr

    # Now sort words_arr and move indexes in index_arr also
    i = 0
    while(i < len)
      j = i + 1
      while(j < len)
        if(words_arr[i] == words_arr[j])
          swap(i+1, j)
          i = j
          break;
        end  
        j += 1
      end 
      i += 1
    end
  puts "------------Revised-------------"
  print words_arr  
  end  
  

def swap(i,j)
    tmp = words_arr[i]
    words_arr[i] = words_arr[j]
    words_arr[j] = tmp

    tmp = index_arr[i]
    index_arr[i] = index_arr[j]
    index_arr[j] = tmp
  end 
end  

arr = ["cat", "dog", "tac", "god", "act"]
@p = PrintAllAnagram.new(arr)
puts @p.check_reader
@p.start