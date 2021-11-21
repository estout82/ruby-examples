#!/usr/bin/ruby

puts "Hi, I'm going to read the file!"
gets # wait for enter

# File.read reads contents of the whole file
contents = File.read('./data/test.txt')

puts contents.to_s