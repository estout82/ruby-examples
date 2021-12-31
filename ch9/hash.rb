#!/usr/bin/env ruby

colors = { blue: "Blue", purple: "Purple", yellow: "Yellow" }

# iteration

colors.each do |(key, value)|  # the (key, value) is destructiring an array
    puts "#{key}: #{value}"
end

colors.each_with_index do |(key, value), index|
    puts "#{key}: #{value} - index #{index}"
end

# inject

all = colors.inject do |result, color|
    result.append ":#{color}"
end

puts
puts all

# reduce