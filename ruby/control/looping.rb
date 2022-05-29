#!/usr/bin/ruby

# looping unconditionally
# - use the 'loop' method & pass a block

i = 0
loop do # use do end for multi-line code blocks and { ... } for single line code blocks
    break unless i < 5

    puts "i am a block"
    i += 1
end

puts

i = 0
while i < 5
    puts "i am a while loop"
    i += 1
end

puts

# like a do / while
i = 0
begin
    puts "i am a begin / while loop"
    i += 1
end while i < 5

puts

# executes the block until the condition is true
i = 0
until i >= 5
    puts "i am an until loop"
    i += 1
end

# while and until modifiers

puts

n = 1
n = n + 1 until n > 3 # doesn't behave like the post-positioned until unless a begin block is used

puts "n: #{n}"

n = 1
n += 1 while n < 3

puts "n: #{n}"