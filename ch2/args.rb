#!/usr/bin/ruby

def one(a)
    a = 10
end

def two(a, b = 1)
    a = 10
end

def three(a, b = 1, *c)
    a = 10
end

def four(a, b = 1, *c, d)
    puts "a: #{a}"
    puts "b: #{b}"
    puts "c: #{c}"
    puts "d: #{d}"
end

#    a    b  c   c  d
four("a", 7, 8 , 9, 100)

#    a  d
four(1, 2)