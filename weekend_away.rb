# (c) Roman Krasavtsev 2016

# https://www.hackerrank.com/contests/booking-hack-a-holiday/challenges/weekend-away

# Problem:

# Pete is tired of spending his weekends at home and wants to leave 
# his apartment for a nice weekend getaway. After checking Villas.com
# for inspiration, he found a lot of countryside accommodations in
# locations L = [L1 .. LN].
# Now he plans to go to LstartLstart, rent a car, travel to a few other
# locations from his list along the way until he reaches his final 
# destination, location Lend, return the car there and head back home.

# It doesn’t matter to Pete which locations he visits, as long as the
# total distance that he drives in his rental car is minimal. However,
# his friends suggest that he not waste time and visits at least three
# locations. Help Pete plan a route in which both his conditions and his
# friends’ suggestions are satisfied.

# Note:

# - Pete can start and finish his route at any locations - Lstart, 
#   Lend ∈ L as long as there is a route from Lstart to Lend.
# - Pete wants to minimize the total driving distance of his route.
# - Following his friends’ suggestions, Pete wants to visit at least 
#   3 locations.
# Pete isn’t worried about the distance from his apartment to Lstart
# or the distance from Lend back to his apartment, so you only need
# to minimize Pete’s driving distance between Lstart to Lend.

# Input Format

# The first line contains integer T, T test-cases follow. The first
# line of each test-case contains integer N that specifies the number
# of locations, followed by integer M that specifies the number of roads
# between locations. Locations have an id [1..N]. Each of the next M lines
# contains three space separated integers A, B and D, which correspond
# to a bi-directional road between A and B that has a length of D km.

# Constraints

# 1<=T<=10
# 3<=N<=10^5
# 2<=M<=4×10^5
# 1<=D<=100

# Output Format

# T lines, each representing the minimal distance Pete needs to drive in km
# for test case i ∈ [1..T]. Note that there always will be a valid solution.

# Sample Input

# 1
# 4 6
# 1 2 2
# 1 3 4
# 1 4 8
# 2 3 3
# 2 4 3
# 3 4 1
# Sample Output

# 4
# Explanation

# In this case, there are two possible routes that are minimized in terms of
# driving distance: 2 -> 3 -> 4 and 2 -> 4 -> 3, they both sum up to a total
# driving distance of 4. They both contain 3 different locations.

t = gets.delete("\n").to_i

(1..t).each do
  nm = gets.split
  n = nm[0].to_i
  m = nm[1].to_i

  path = {}
  (0..m-1).each do
    abd = gets.split
    path[abd[0]] = [] unless path[abd[0]]
    path[abd[1]] = [] unless path[abd[1]]
      
    path[abd[0]] << abd[2].to_i
    path[abd[1]] << abd[2].to_i
  end

  distance = Float::INFINITY
  path.each do |i, element|
    min = Float::INFINITY
    mid = Float::INFINITY
    
    element.each do |m|
      if m < min
       mid = min
       min = m
      elsif m < mid
       mid = m
      end
    end

    distance = (min + mid) if (min + mid) < distance
  end

  puts distance
end
