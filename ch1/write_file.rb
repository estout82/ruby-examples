#!/usr/bin/ruby

puts "Name your file: "
file_name = gets

handle = File.new("./data/" + file_name, "w")

puts "File contents: "
contents = gets

handle.write(contents)
handle.close