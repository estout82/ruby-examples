#!/usr/bin/ruby

# a message send is usually a method call

module Reportable
    def report
        puts "Report from the reportable module"
    end
end

module Safe
    def method_missing(call)
        puts "Uh oh, you called a method that doesn't exist"
    end
end

class User
    include Reportable
end

class Admin < User
    include Safe

    def report
        super # calls the next highest definition of this method

        puts "in admin report"
    end
end

a = Admin.new

# a is an instance of Admin
# does Admin have a method 'report'? - no
# does Admin include modules? - no
# does superclass User have a method 'report'? - no
# does superclass include modules? - yes
# does module have a method report? - yes, call it
# call method_missing if not found (you can override this)
a.report

a.non_existant

# Kernal module
# - included by Object
# - method definitions are in C (like w/ Object, BasicObject, etc)
# - contains most basic methods

# prepend vs. include
# include - appends the module to the search path
# prepend - insert the module at the top of the search path (the module will take presendence over everything)

module Important
    def hello
        puts "hello world!" # this will take precendence
    end
end

class HelloWorld
    prepend Important

    def hello
        "hello, cruel world..."
    end
end

h = HelloWorld.new
h.hello

puts "HelloWorld.ancestors: #{HelloWorld.ancestors}"