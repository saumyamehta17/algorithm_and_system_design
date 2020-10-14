def most_visited_pattern(username, timestamp, website)
  visited_hsh = {}
  username.each_with_index do |user, indx|
    visited_hsh[user] ||= []
    visited_hsh[user] << website[indx]
  end
  three_seq = []
  visited_hsh.each do |k,v|
    three_seq += possible_3_sets(v)
  end

  max_hsh = Hash.new(0)
  max = 0; patterns = []
  three_seq.each do |seq|
    max_hsh[seq] += 1
    curr = max_hsh[seq]
    if curr > max
      max = curr; patterns = [seq]
    elsif curr == max
      patterns << seq
    end
  end
  patterns.count == 1 ? patterns.first : patterns.sort.first
end

def possible_3_sets(v)
  triplets = []
  if v.length == 3
    triplets += [v]
  elsif v.length > 3
    triplets += v.combination(3).to_a
  end
  triplets
end

username = ["joe","joe","joe","james","james","james","james","mary","mary","mary"]
timestamp = [1,2,3,4,5,6,7,8,9,10]
website = ["home","about","career","home","cart","maps","home","home","about","career"]

username = ["joe","joe","joe","joe","james","james","james","james","mary","mary","mary"]
timestamp = [0,1,2,3,4,5,6,7,8,9,10]
website = ["home","about","cart","lodge","home","cart","maps","home","home","about","career"]
res = most_visited_pattern(username, timestamp, website)
puts res.to_s