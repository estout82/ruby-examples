#!/usr/bin/ruby

require_relative '../helper'

# classes are defined as constants (start with uppercase)
class Ticket
    def event # this is an instance method
        "unknown"
    end

    def override
        1
    end

    def override # this will take over because it's defined last
        2
    end
end

# re-open a class
class Ticket
    def other # will also be an instance method
        "defined again..."
    end
end

t = Ticket.new

puts t.event
puts t.override
puts t.other

print_divider("initializers")

# initailizers
class Rock
    attr_reader :size # creates a 'getter' for the size instance variable

    def initialize(size, color)
        puts "initializing a rock..."
        @size = size
        @color = color
    end

    def to_s
        "size: #{@size} color: #{@color}"
    end

    # can call this method with r.size = ...
    # - doesn't return the value of the assignment, returns the value of the last expression evaluated
    def size=(size)
        @size = size
    end
end

r = Rock.new("10lbs", "gray")
puts r.to_s

r.size  = "8lbs"
puts r.to_s

print_divider("attributes")

# attribute: property of an object that can be read and/or written through the object
# - basically just instance varaibles wrapped around a getter and setter

class House
    attr_reader :beds, :baths, :sqft # these are now all read only instance vars
    
    # the above method has no reciever, so the messages go to self, which in this case is the House object
    # - this means that the methods will be defined on the self.House object

    attr_writer :beds # write only
    attr_accessor :price # read and write
end

# inheritance
# - ruby only supports single inheritance

class A

end

class B < A

end

print_divider("inheritance")

puts B.name # B
puts B.superclass # A
puts B.superclass.superclass # Object - 58 instance methods
puts B.superclass.superclass.superclass # BasicObject - this is the bottom level (only 8 instance methods)

puts "\n"

# classes are objects with a class of Class
puts A.superclass
puts A.class # class
puts B.class

puts "\n"

b = B.new

puts "b.is_a?(A): #{b.is_a?(A)}" # true