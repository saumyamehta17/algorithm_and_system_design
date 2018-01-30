5.times.map do |i|
  var = nil
  Thread.new do
    var = i
    print "I: #{var} "
    print "2I: #{var * 2} \n"
  end
end.each(&:join)

# I 0 2I 0
# I 1 2I 2
# I 2 2I 4
# I 3 2I 6
# I 4 2I 8