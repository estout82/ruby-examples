#!/usr/bin/ruby

# exception is an instance or descendent of the Exception class
# - exceptions can be raised throughout the program at run-time
# - use a rescue clause to deal with exceptions

# common errors
# - RuntimeError                default errr (call raise)
# - NoMethodError               message reciever does not have that method
# - NameError                   run time cannot resolve a name
# - IOError                     reading a closed stream, write to read only stream, etc...
# - TypeError                   "a" + 3 - can't add to a string
# - ArgumentError               call a method with wrong number of args

x = 10
y = 0

begin
    result = x / y
    puts "result: #{result}"
rescue ZeroDivisionError
    puts "caught a ZeroDivisionError exception"
rescue
    puts "caught an unknown exception"
    raise # re-raise the exception, used to do some processing and then have the rest of the app handle the exception
          # think logging
end

def open_file # implicit begin here (same thing works for do / end blocks)
    puts "opening data.txt"

    fh = File.open("data.txt")
    fh.close

    rescue # resuce clause of the implicit begin, usually you want to catch specific errors not all exceptions
        puts "could not open file"
end

open_file

def do_something(value)
    if value < 100
        raise ArgumentError, "value is too small"
    end

    return value - 100
end

begin
    do_something(88)
rescue ArgumentError => e
    puts "e.to_s: #{e}"
    puts "e.message: #{e.message}"

    puts
    puts "------- trace ---------"
    e.backtrace.each do |trace|
        puts trace
    end
ensure # use the ensure clause to do clean-up... runs weather an exception is raised or not
    puts "cleaning up!"
end

# custom exceptions

module Customer
    class InvalidSalesforceId < Exception
    end

    def process(id)
        raise InvalidSalesforceId, "it can't be 0" if id == 0
    end
end

class Person
    include Customer
end

p = Person.new

begin
    p.process(0)
rescue Exception => e
    puts "e.class: #{e.class}"
    puts "e.messsage: #{e.message}"
end