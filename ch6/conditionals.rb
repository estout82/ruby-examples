#!/usr/bin/ruby

# conditionals

x = 10
str = ""

if x < 1
    str = "true"
end

if x < 100 then str = "true" end

# semi-colons can mimic line breaks
if x == 0; str = "true"; end

if x == 0
    str = "true"
elsif x == 1
    str = "true"
else
    str = "false"
end

# can negate conditions with ! and not

if not x == 0
    str = "true"
end

# if x is not greater than 100
# - don't use unless with an else clause, it's confusing
# - flip the logic for an if statement
unless x > 100
    str = "small number"
end

# conditional modifiers
# - an if clause at the end of a statement

puts "big number" if x > 100
puts "big number" unless x < 100

def return_nil
    return nil
end

def return_not_nil
    return Object.new
end

if y = return_nil # is false because the value returned by this assignment is nil
    puts "this shouldn't work"
elsif y = return_not_nil
    puts "this should work"
end

# interesting note about local variables...
# - local vars are allocated (& assigned nil) when a new block is encoutered. even when the block is not run!s

if false
    a = 100
end

puts "a: #{a.class}"        # nil
#puts "b: #{b}"             # this would be a fatal error because it doesn't exist

answer = "y"

# threequal operator
# - case sensitive
# - answer.===(foo)

case answer
when "y" # calls the === operator ex: answer === "y"
    puts "yes"
when "n" # blocks don't run into eachother
    puts "no"
else # like default
    puts "unknown"
end

# like a long if / elsif
case
when answer === "s"
    puts "s"
    exit # like break - would exit program
end

# note: conditionals all resolve to objects

r = if true; "result of if statement"; end
puts "r: #{r.to_s}"