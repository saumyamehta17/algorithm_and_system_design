# Question
# https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/537/week-4-may-22nd-may-28th/3342/


# split people in 2 groups such two people can not come together if they are dislike eachother
require 'Set'
def possible_bipartition(n, dislikes)
  return true if dislikes.empty?
  g1 = Set.new
  g2 = Set.new

  while(!dislikes.empty?)
    a = dislikes[0][0]
    b = dislikes[0][1]
    return false if (g1.include?(a) && g1.include?(b)) || (g2.include?(a) && g2.include?(b))
    g1.add(a); g2.add(b)

    rem = []
    for i in 1...dislikes.length
      d = dislikes[i]
      a,b = d[0], d[1]

      if (g1.include?(a) && g1.include?(b)) || (g2.include?(a) && g2.include?(b))
          return false
      elsif (g1.include?(a) && g2.include?(b)) || (g2.include?(a) && g1.include?(b))
          next
      elsif g1.include?(a)
          g2.add(b)
      elsif g2.include?(b)
          g1.add(a)
      elsif g1.include?(b)
          g2.add(a)
      elsif g2.include?(a)
          g1.add(b)
      else
          rem << d
      end
    end
    dislikes = rem
  end

  true
end

dislikes = [[1,2],[1,3],[2,4]]; n = 4
dislikes = [[1,2],[1,3],[4,5], [1,2]]; n = 5
dislikes = [[1,2],[3,4],[1,3],[1,4]]; n = 4
dislikes = [[1,2],[3,4],[1,3],[5,6]]; n = 4
dislikes = []; n = 1
dislikes = [[1,2],[3,4],[1,3],[1,4]]; n = 4
puts possible_bipartition(n, dislikes)