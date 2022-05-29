#!/usr/bin/ruby

def my_loop
    unless block_given?
        puts "no block"
        return
    end

    yield while true # yield calls the block past to this method
end

i = 0
my_loop { break unless i < 5; puts i; i += 1; }

my_loop # no block given

puts

# blocks and arguments
#                    (self)             () optional    could also use do |...args|; ...; end
# method call syntax <receiver>.<object>(...args)      { |...args| block }

string = "my string 1234"

# args go in (), block goes after, |...| are params passed into block by calling yield
string.scan(/\d{2}/) { |match| puts "matched #{match}" }

i = 0
string.scan(/\w{2}/) do |match|
    break unless i < 5 # only print first 5 matches

    puts "match #{i}: #{match}"
    i += 1
end

# block operator presedence

puts

arr = [1, 2, 3]

# the block is evaled first, printing the returned array
# puts(arr.map { |n| n * 10 })
puts arr.map { |n| n * 10 }

# block is passed to puts not arr
# puts(arr.map) do |n| ... block is ignored by puts
puts arr.map do |n|
    n * 10
end

# times: instance method of Integer class
# - yields to block (passing in index) 

puts

2.times do |i|
    puts "#{i}: i am a .times method call"
end

puts

arr.each do |elem|
    puts "arr: #{elem}"
end

# note: blocks have direct access to variables that already exist (locals, etc.. in enclosing scope)
# - blocks share a local scope with the code that preceeds them
# - params given to block take precedence when a name collision occurs

puts

g = 100

arr = [100, 200, 300]
new_arr = arr.map do |g|
    puts "g in block: #{g}"
    g = g / 10
    next g # 'returns g' and procceeds to next elem in enumerator
end

puts "g outside of block: #{g}"
puts "new arr: #{new_arr}"

# blocks have access to 3 types of variables
# - locals that exist when the block is created
# - block params (these are block-local)
# - true block locals (local vars in the block)