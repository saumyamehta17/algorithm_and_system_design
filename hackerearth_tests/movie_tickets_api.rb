require 'net/http'
require 'json'
def funWithAnagrams(s)
# Write your code here
 result_hash = {}

 s.each do |word|
   sorted = word.chars.sort.join
   next if result_hash[sorted]
   result_hash[sorted] = word
 end
 result_hash.values.sort
end

puts funWithAnagrams(['code', 'aaagmnrs', 'anagrams', 'doce'])

def movie_tickets(substr)
  page_number = 1
  titles = []

  while(1)
    url = "https://jsonmock.hackerrank.com/api/movies/search/?Title=#{substr}&page=#{page_number}"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    output = JSON.parse(res.body)
    if output["data"].empty?
      break 
    end  
    titles += output["data"].map { |o| o["Title"] }
    page_number += 1
  end
  titles.sort
end  

substr = "spiderman"
# movie_tickets(substr)