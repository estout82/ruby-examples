#!/usr/bin/env ruby

colors = { blue: "Blue", purple: "Purple", yellow: "Yellow" }

colors.except :purple                                   # returns new hash will all keys except the ones specified
colors.except! :purple

#
# iteration
#

colors.each do |(key, value)|  # the (key, value) is destructiring an array
  puts "#{key}: #{value}"
end

colors.each_with_index do |(key, value), index|
  puts "#{key}: #{value} - index #{index}"
end


#
# reduce
#

# output => "1:2"
{ a: 1, b: 2 }.reduce do |memo, (key, val)|
  memo = memo.is_a?(Array) ? memo[1] : memo # memo is Array on first run since index 0 of the has is passed in as [key, val]
  memo = memo.to_s  + ":" + val.to_s
end

#
# inject
# - alias for reduce
#

#
# tap
# - do something with an object in a block and return that object
# - makes code more readable
#

obj = Object.new.tap do |o|
  o[:num] = 5
end

obj[:num] # => 5