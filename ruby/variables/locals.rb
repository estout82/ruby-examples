#!/usr/bin/ruby

# immediate values
# - NOT stored as references
# - hold the value itself, not a reference to the object
my_int = 10
my_sym = :symb
my_nil = nil
my_bool = false # or true

str = "Hello"
abc = str # points to "hello" object not the str ref
str = "Goodbye" # abs still points to the "hello" object

puts str # outputs goodbye
puts abc # outputs hello

# NOTE: l-value (left value) - something that can take an assignment
# 100 = 10 - ERROR: 100 is not an l-value