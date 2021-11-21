#!/usr/bin/ruby

# demo of how to get user input from the console
puts "Hello, what is your name?"
name = gets

# gsub replaces the first arg with the second arg everywhere in the string
name = name.gsub("\n", "")

puts "Hi, " + name + "!"