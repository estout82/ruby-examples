#!/usr/bin/ruby

# modules are like classes but they can't have instances
# - Module is a superclass of the 'Class' class
# - they get 'mixed in' to existing classes
# - classes have access to the instance methods and varibales defined in the module

module VersionTester
    attr_accessor :foo

    def print_version
        system("ruby -v")
    end
end

class MyClass
    include VersionTester # now my class has the instance methods and vars defined in VersionTester module
end

c = MyClass.new
c.print_version # included from module

c.foo = 100
puts("c.foo: #{c.foo}")

x ||= 50 # set x to 50 if x is nil or false
x &&= 200 # set x to 200 if x isn't nil or false

module Tools
    class Hammer
        def do
            puts "swing!"
        end
    end
end

ham = Tools::Hammer.new
ham.do