require 'pry'
no_of_testcases = gets.chomp.to_i

(1..no_of_testcases).to_a.each do |t|
    no_of_people = gets.chomp.to_i
    answers = gets.chomp.split(' ')
    final_arr = []
    i = 0
    while(i < answers.length)
    sub_answers = []
      (i..(i+answers[i].to_i-1)).to_a.each do |k|
          sub_answers << answers[k].to_i
       end        
      final_arr << sub_answers.uniq.reduce(:+)
      i += answers[i].to_i
    end    
    if(final_arr.reduce(:+) == no_of_people)
        puts final_arr.count
    else
        puts "Invalid Date"
    end    
end 

# Countries Grouping
# People in the group, are sitting in a row numbered from 
# 1
# 1 to 
# N
# N. Every person have been asked with a same question as

# How many people of your country are there in the group?
# The answers provided may be incorrect. It is known that people of same countries always sit together.

# If all the given answers are correct, determine the number of distinct countries present otherwise print "Invalid Data".

# Input

# First line contains one integer, which denotes the number of test cases

# Each test case consists of 2 lines:

# The first line contains one integer 
# N
# N, which denotes the total number of people there in the group.

# The second line contains 
# N
# N space-separated integers say 
# A
# i
# Ai , which denotes the answer given by the 
# i
# t
# h
# ith person.

# Output

# For each test case output a single line containing a single integer denoting the distinct countries or "Invalid Data".

# Constraints:

# 1
# ≤
# T
# ≤
# 1000
# 1≤T≤1000 
#  1
# ≤
# N
# ≤
# 100
# 1≤N≤100 
#  1
# ≤
# A
# i
# ≤
# 1000
# 1≤Ai≤1000 
