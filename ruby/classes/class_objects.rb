#!/usr/bin/ruby

require_relative "../helper"

# classes are special objects, they're the only kind that can spawn new objects (instances)
# create new class objects with class keyword

class MyClass # usually a constant
    attr_accessor :prop

    def initialize(prop)
        self.prop = prop
    end
end

inst = MyClass.new("hello") # sends new message to MyClass object, & calls contructor (initialize)

puts "inst.prop: #{inst.prop}"

print_divider("anonymous classes")

c = Class.new do
    def print
        puts "I am an anonymous class!"
    end
end.new # not sure why that is needed

c.print

print_divider("singleton methods")

# singleton methods are defined on the class (static methods)
# - use them when you need to preform an operation that can't be preformed on individual instances

class Transaction
    attr_accessor :amount
    attr_accessor :name

    def initialize(name, amount)
        self.name = name
        self.amount = amount
    end
end

def Transaction.most_expensive(*transactions)
    # &: uses a proc that is passed into that max_by array instance method
    transactions.max_by(&:amount)
end

steve = Transaction.new("Steve", 10000)
ben = Transaction.new("Ben", 5000)

puts Transaction.most_expensive(steve, ben).name

# how to refer to methods
# Transation#foo - instance method
# Transaction.foo - class method
# Transaction::foo - also class method