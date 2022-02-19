#!/usr/bin/env ruby

# selection sort : O(n ** 2)
# - find smallest element in array, then add it to a new array and remove it from start array. repeat until new array contains
#   all elements from start array in sorted order. use linear search to find smallest element in start array

arr = (0..100).to_a
arr.shuffle!

def find_smallest_index(arr)
  smallest = nil
  smallest_index = 0

  arr.each_with_index do |num, index|
    smallest ||= num
    if smallest > num
      smallest = num
      smallest_index = index
    end
  end
  
  smallest_index
end

def selection_sort(arr)
  new_arr = []

  (0...arr.length).each do |index|
    smallest_index = find_smallest_index(arr)
    new_arr << arr[smallest_index]
    arr.delete_at(smallest_index)
  end

  new_arr
end

puts "unsorted ---"
puts "#{arr}"

puts
puts "sorted ---"
puts "#{selection_sort(arr)}"
