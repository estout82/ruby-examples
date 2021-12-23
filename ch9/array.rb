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
                            

puts
puts a
puts

obj = Object.new

def obj.to_ary
    return [1, 2, 3, 4, 5]
end

obj_ary = Array(obj) # calls obj.to_ary

puts "obj_ary: #{obj_ary}"

# try_convert

Array.try_convert(obj) # looks for a suitable conversion method and if none exists returns nil

a = [1, 2, 3]

#[](i)          : get element at index i

puts a.[](1)

#[]=(i, v)      : set element at index i to v

a.[]=(0, 100)

puts a

# dig           : takes indexes and gets elements from a multi-dimentional array

puts
puts "dig --"

a = [1, [2, [3, 4]]]
n = a.dig(1, 1, 0) # 3
puts "n: #{n}"

# unshift       : add an object to the beginning of the array

puts
puts "unshift --"

a = [1, 2, 3]
a.unshift(0)
puts a.to_s

# push / <<     : add an object to the end of the array

puts
puts "push / << --"

a = [1, 2, 3]
a.push(4)
a << 5 # same thing
puts a.to_s

# pop           : remove element from the end

puts
puts "pop --"

a = [1, 2, 3, 4, 5]
a.pop # returns the element that was removed
a.pop(2) # remove 2 elements
puts a.to_s

# shift         : remove element from the start

puts
puts "shift --"

a = [1, 2, 3, 4, 5]
a.shift # also returns the element that was removed
a.shift(2) # remove 2 elements
puts a.to_s

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

# concat 