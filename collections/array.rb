#!/usr/bin/env ruby

a = [1, 2, 3]

(one, two) = a # destructuring

puts "one + two: #{one + two}"

# can create arrays with 4 ways

a = Array.new                           # constructor
a = Array.new(3) { |i| i * 10 }         # can pass a block to Array.new
a = []                                  # literal constructor
a = Array("hi")                         # top level method - converts objects to arrays (calls to_a or to_ary)
a = %w(hi there man)                    # special syntax to allow constructing arrays of words (short hand for words)
                                        # - can be any delimeter () are used most often
                                        # - splits the string by whitespace
a = %W(hi there man #{100})             # - %w is for single quoted strings, %W is for double
a = %i(arr of symbols)                  # creates an array of symbols
a = %I(arr of #{1 + 3} symbols)

obj = Object.new

def obj.to_ary
    return [1, 2, 3, 4, 5]
end

obj_ary = Array(obj) # calls obj.to_ary

# Operation
# Retrieve single element 	        [index], slice(index)
# Retrieve multiple elements 	    [index, length], [start..finish], slice(index, length), slice(start..finish), values_at(index1, index2...)
# Retrieve nested elements 	        dig(index1, index2...)
# Set single element 	            [index]=
# Set multiple elements 	        [index, length]=, slice(index, length)
# Delete elements 	                slice!(index), slice!(index, length), slice!(start..finish)
# Add element to beginning 	        unshift
# Remove element from end 	        pop, pop(length)
# Remove element from beginning 	shift, shift(length)
# Add element to end 	            push, push(el1, el2...), <<

#
# try_convert
#

Array.try_convert(obj) # looks for a suitable conversion method and if none exists returns nil

a = [1, 2, 3]

#
#[](i)          : get element at index i
#

puts a.[](1)

#
#[]=(i, v)      : set element at index i to v
#

a.[]=(0, 100)


#
# dig
# - takes indexes and gets elements from a multi-dimentional array
#

a = [1, [2, [3, 4]]]
n = a.dig(1, 1, 0) # 3

#
# unshift
# - add an object to the beginning of the array
#

a = [1, 2, 3]
a.unshift(0)

#
# push
# - << is alias
# - add an object to the end of the array
#

a = [1, 2, 3]
a.push(4)
a << 5 # same thing

#
# pop
# - remove element from the end
#

a = [1, 2, 3, 4, 5]
a.pop # returns the element that was removed
a.pop(2) # remove 2 elements

#
# shift         : remove element from the start
#

a = [1, 2, 3, 4, 5]
a.shift # also returns the element that was removed
a.shift(2) # remove 2 elements

#
# reduce
# - combines all elements of an array by applying an operator or block
#

sum = [1, 2, 3, 4].reduce(:+) # applies the + operator to reduce the array

# output: 1:2:3:4
# reduce starts with memo = value at index 0, num = value at index 1
[1, 2, 3, 4].reduce { |memo, num| memo = memo.to_s +  ":" + num.to_s }

#
# compact
#

a.compact                                               # return array with nil objects removed

#
# find, detect - find a single element (first match)
#

arr.detect(1)
arr.find(1)
arr.detect ->(n) { n == 1 }
arr.find ->(n) { n == 1 }
arr.detect { |n| n == 1 }
arr.find { |n| n == 1 }

[1, 2, 3, 4].do { |n| next if n >= 3; puts n }