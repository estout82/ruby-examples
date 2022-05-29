#!/usr/bin/ruby

# bang !
# - convention labels them as dangerous
# - usually means it permenantly modifies its reciever
# - usually methods come in bang and non-bang pairs: ex sub sub!
# - don't use ! excemt in m/m! method pairs
# - ! means dangerous NOT destructive. ex String#clear is destructive but has no non-destructive counterpart

hi = "hello"

puts "hi.upcase: #{hi.upcase}"
puts "hi: #{hi}"
puts "hi.upcase!: #{hi.upcase!}" # permenatly modifies receiver
puts "hi: #{hi}"

# usually, bang methods are more resource efficent because copying an object is expensive

name = "tim"

up = name.upcase # has to make a deep copy and return it
name.upcase!