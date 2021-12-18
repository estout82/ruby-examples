#!/usr/bin/env ruby

# symbols
# - instances of the Symbol class
# - literal contructor of leading colon - :symbol

my_sym = :cool_beans

my_sym_alt = "cool_beans".to_sym # can use to_sym to convert variable to a symbol

# symbols are immutable (similar to integers)
begin
    :a << :bc
rescue
    puts "changing symbols is not allowed"
end

# symbols are unique
# - Symbol has no .new method
puts ":xyz.object_id == :xyz.object_id #{:xyz.object_id == :xyz.object_id}" # they're the same object
puts "\"xyx\".object_id == \"xyz\".object_id #{"xyz".object_id == "xyz".object_id}"

# there is a lot of them
puts "Symbol.all_symbols.size: #{Symbol.all_symbols.size}"

# new symbols are added to symbol table (internal array of symbols) often
# - when a new class or method is created
# - assign a variable or constant, etc..

abc = 10

# have to use grep because /include?(:abc) would create the symbol by referencing it even it it didn't exist already
puts "Symbol.all_symbols.grep(/abc/): #{Symbol.all_symbols.grep(/abc/)}"
puts "Symbol.all_symbols.grep(/abcd/): #{Symbol.all_symbols.grep(/abcd/)}"

# two common use cases for symbols
# - method arguments
# - hash keys

obj = Object.new

method = :object_id

# can me used to dynamically decide which method to call at runtime
puts "obj.send(method): #{obj.send(method)}"

def do_something(what)
    # it's polite to accept strings OR symbols where a symbol is expected as a method param
    what = what.to_sym if what.instance_of?(String)
end

colors = { blue: "Blue", orange: "Orange" }

puts colors[:orange] # it's a tiny bit faster to look up a hash key with a symbol