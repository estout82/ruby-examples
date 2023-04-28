#!/usr/bin/env ruby

#
# procs
#

# a proc is basically a wrapper around a block
proc_1 = proc { puts "i am a proc" }
proc_2 = proc { |x| puts "i am another proc with argument #{x}" }

proc_1.call
# => i am a proc

proc_2.call 100
# => i am another proc with argument 100

# procs don't validate their argument list
proc_1.call 1, foo: :bar
# => i am a proc

#
# lambdas
#

# a lambda is more of an inline function (trad definition of or a lambda)
lamb_1 = lambda { puts "i am a lambda" }

lamb_2 = lambda { |x| puts "i am a lambda with an argument #{x}" }

lamb_3 = lambda {
  (1..5).each do |n|
    if n > 4
      return "done"
    end
  end
}

lamb_1.call
# => i am a lambda

lamb_2.call 888
# => i am a lambda with an argument 888

# lambdas DO validate their argument list
begin
  lamb_1.call 100, foo: :bar
rescue ArgumentError => error
  puts "ArgumentError rescued: #{error.message}"
end

# control flow statements apply to lambda's scope NOT enclosing scope
str = lamb_3.call
puts str
# => done

# -> is short-hand for lambda, class is still proc for some reason
thing = -> (x) { x + 10 }

puts thing.class
# => Proc

begin
  thing.call # will raise because an arg is expected
rescue ArgumentError => error
  puts "ArgumentError rescued: #{error.message}"
end
