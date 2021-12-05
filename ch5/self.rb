#!/usr/bin/ruby

# self is the default object
# - self is also the default receiver of messages

def hello
    puts "hi"
end

hello # equivaliend to self.hello

# at the top level, self is the "main" object
# - top level = code outside a method, class, or module mixin
puts "#{self}"

# self inside a method call is the object to which the message was sent

class C
    # self inside a class definition is the class itself

    # use self.foo instead oc C.foo incase you rename the class or want to move code to new class
    def self.foo
        # self inside a class method is the class also (C)
        puts "self.class in class method: #{self.class}"
    end

    def hello
        puts "hey man"
    end

    def bar
        # self inside an instance method is the instance of C that the message was sent to
        puts "self.class in an instance method: #{self.class}"

        hello # will call self.hello
    end
end

C.foo

c = C.new
c.bar

o = Object.new

def o.meth
    # self in this singleton method is o
end