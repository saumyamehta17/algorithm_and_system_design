# Find Itinerary from a given list of tickets
# Input:
# "Chennai" -> "Banglore"
# "Bombay" -> "Delhi"
# "Goa"    -> "Chennai"
# "Delhi"  -> "Goa"

# Output: 
# Bombay->Delhi, Delhi->Goa, Goa->Chennai, Chennai->Banglore


def find_itinerary(route_hash)
  start = find_starting_point(route_hash)
  if start.nil?
    return nil
  end
  to = route_hash[start]
  while(!to.nil?)
    puts "#{start} => #{to}"
    start = to
    to = route_hash[to]
  end  
end  


def find_starting_point(route_hash)
  reverse_hsh = {}
  route_hash.each do |k,v|
    reverse_hsh[v] = k
  end

  route_hash.each do |k,v|
    if reverse_hsh[k].nil?
      return k
    end  
  end  
end  

route_hash = {"Chennai" => "Banglore", "Bombay" => "Delhi", "Goa" => "Chennai","Delhi" => "Goa"}
find_itinerary(route_hash)
