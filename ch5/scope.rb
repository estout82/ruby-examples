#!/usr/bin/ruby

# global scope - the entire program
# - never go out of scope (except thread-local-global)

# default global variables
$: # path
$$ # pid

$x = 10 # a global variable

require "English" # loads english versions of the global variables

puts "path: #{$LOAD_PATH}"

# local scope
# - when searching for a local, innermost scopes are checked first
# - each new block (class, method, module) has its own scope

# constants

class Violin
    class String

    end

    def print
        puts "String.class #{String.ancestors}" # Violin::String

        # ::String forces absolute constant lookup
        puts "::String.class #{::String.ancestors}" # String
    end
end

v = Violin.new
v.print

# class variables & scope
# - class vars are class hierarcy scoped
# - they belong to the whole class hierarchy

class Car
    @@makes = []
    @@cars = {}
    @@total_count = 0

    attr_reader :make

    def self.add_make(make)
        unless @@makes.include?(make)
            @@makes << make
            @@cars[make] = 0
        end
    end

    def initialize(make)
        if @@makes.include?(make)
            puts "creating a new #{make}"
            @@cars[make] += 1
            @@total_count += 1
            @make = make
        else
            raise "No such make #{make}"
        end
    end

    def make_mates
        @@cars[self.make]
    end
end

Car.add_make("Honda")
Car.add_make("Ford")
h = Car.new("Honda")
f = Car.new("Ford")
h2 = Car.new("Honda")

puts "h2.make_mates: #{h2.make_mates.to_s}" # 2

class Parent
    @@value = 100
end

class Child < Parent
    @@value = 200
end

class Parent
    puts "@@value: #{@@value}" # 200 b/c the @@value var is unique to the whole class hierachy (NOT class)
end