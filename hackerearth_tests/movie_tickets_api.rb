require 'net/http'
require 'json'
def movie_tickets(substr)
  pageNumber = 1
  titles = []

  while(1)
    url = "https://jsonmock.hackerrank.com/api/movies/search/?Title=#{substr}&page=#{pageNumber}"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    output = JSON.parse(res.body)
    if output["data"].empty?
      break 
    end  
    output["data"].map {|o| titles << o["Title"]}
    pageNumber += 1
  end
  puts titles.to_s
end  

substr = "Iron"
movie_tickets(substr)