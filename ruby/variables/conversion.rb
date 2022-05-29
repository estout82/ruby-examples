#!/usr/bin/ruby

# note: to_* methods create new objects

# to_s
# - every object except instances of BasicObject responds to to_s
10.to_s

obj = Object.new

def obj.to_s
    "I am an object!"
end

puts obj # puts calls to_s on its args

s = "obj.to_s: #{obj}" # to_s also gets called during interpolation

puts s

# to_i & to_f
# - behave similarly

s = "hello"
puts "s.to_i: #{s.to_i}" # all non-number things get converted to 0

s = "123hello"
puts "s.to_i: #{s.to_i}" # all non-number chars are ignored, left with 123

# these are stricter, will throw ArgumentError if there is non-valid chars
Integer("100")
Float("28.89")

# to_a
# - less common, defined in Array class
# - convert to array

range = (1..5)
range_array = range.to_a

puts "range: #{range}"
puts "range_array: #{range_array}" # range converted to array

Computer = Struct.new(:os, :manufacturer)
laptop_one = Computer.new("linux", "lenovo")
laptop_two = Computer.new("macos", "apple")

puts "laptop_one.to_a: #{laptop_one.to_a}" # can call .to_a on structs

# inspect
# - again, every object except instances of BasicObject respond to inspect
# - irb calls inspect on every value it prints out

puts "obj.inspect: #{obj.inspect}" # default is to print out object's location in memory

class Person
    def initialize(name)
        @name = name
    end

    def inspect
        @name
    end
end

p = Person.new("steve")

puts "p.inspect: #{p.inspect}"

# display
# - not used very much, prints the object to STDOUT or a file stream

"Hello".display # doesn't print \n
puts

fh = File.open("data.txt", "w")
"Hello, file".display(fh) # will print Hello, File to data.txt
fh.close

# to_str
# - makes an object 'role play' as a string
# - useful when you need an object to behave as a string would (operators, etc...)

class Plane
    def initialize(model)
        @model = model
    end

    def to_str
        @model
    end
end

plane = Plane.new("sesna")

puts "Hello " + plane # .to_str is called and object will be treated as a string

# to_ary
# - same thing as above but an array