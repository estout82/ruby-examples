#!/usr/bin/env ruby

arr = []

arr = (0..100000000).to_a

shuffled = arr.shuffle

def linear_search(arr, search, start)
  arr.each_with_index do |num, index|
    if num == search
      puts "linear search found #{num} at index #{index} in %.10f" % (Time.now - start)
    end
  end
end

def binary_search(arr, search, start)
  index = arr.length / 2

  if arr[index] == search
    puts "binary search found #{arr[index]} in %.10f" % (Time.now - start)
  elsif arr[index] > search
    binary_search(arr[0...index], search, start)
  elsif arr[index] < search
    binary_search(arr[index + 1..arr.length], search, start)
  end
end

puts "starting linear search..."
linear_search(shuffled, 384, Time.now)

puts "starting binary search..."
binary_search(arr, 384, Time.now)