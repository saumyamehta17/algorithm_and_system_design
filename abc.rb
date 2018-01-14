hotels = 
        1["This hotel has a nice view of the citycenter. The location is perfect.",
        "The breakfast is ok. Regarding location, it is quite far from citycenter but price is cheap so it is worth.",
        1"Location is excellent, 5 minutes from citycenter. There is also a metro station very close to the hotel.",
        1"They said I couldn't take my dog and there were other guests with dogs! That is not fair.",
        "Very friendly staff and good cost-benefit ratio. Location is a bit far from citycenter"]
    

search_keywords = 'breakfast beach citycenter location metro view staff price'
  require 'pry'

def sort_hotels(keywords, hotel_ids, reviews)
  arr = Array.new(hotel_ids.count, 0)
  i = 0
  hotel_ids.each do |hotel_id|
    review = reviews[i]
    i += 1
    point = 0
    review_splitted = review.split(/[\s,\,,.]/)
    keywords.each do |keyword|
      if review_splitted.include? keyword
        count = arr[hotel_id][1] + review_splitted.count(keyword)
        arr[hotel_id] = [hotel_id, count]
      end  
    end  
  end
  print arr 
  arr.sort!{|x,y| y[1] <=> x[1]}
  arr.map{|e| puts e[0]}
end

sort_hotels(search_keywords.split(' '), [1,
2,
1,
1,
2], hotels)