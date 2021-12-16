#!/usr/bin/ruby

# built-ins are part of the core library (no need to require)
# standard library classes need to be required

# popular built-ins: Array, Binding, Dir, Exception, File, Float, Hash, IO, Integer, Kernel, Math, Mutex, Proc, 
#                    Process, Random, Range, Rational, String, Struct, Symbol, Thread, Time

# popular std-lib: Base64, Benchmark, BigDecimal, CSV, Date, Digest, ERB, FileUtils, JSON, Logger, net/* methods, open* methods,
#                  PrettyPrint, Prime, Psych, Rake, Rdoc, Scanf, Set, Shell, Singleton, Socket, StringIO, Tempfile, Time, URL,
#                  WEBrick YAML

Time.now # no need to require

require 'date'

d = Date.new # have to require

# literal constructors
# - a way to create new objects with sytax not .new

# creates a new String object
string = "string"
puts "string.class: #{string.class}"

# creates a new Symbol object
sym = :my_sym
other_sym = :"my sym with spaces"
puts "sym.class: #{sym.class}"

# creates a new Array object
arr = [1, 2, 3]
puts "arr.class: #{arr.class}"

# creates a new Hash object
h = { "one": 1, "two": 2 }
puts "h.class: #{h.class}"

# creates a Range object
r = (1..5)
puts "r.class: #{r.class}"

# creates a Regexp object
reg = /\w{5}.*$/
puts "reg.class: #{reg.class}"

# creates a new Proc object
p = ->(x, y) { x * y }
puts "p.class: #{p.class}"

# sytactic sugar
# - built-in ways to call methods in ruby

# these statements are equivalent
a = 1 + 2
a = 1.+(2)

obj = Object.new

def obj.+(right)
    puts "trying to add #{right} to me??"
end

obj + 5

# can override the following operators
# +         def +(x)
# -
# *
# /
# %
# **                                                exponent
# []        def [](x)                               get
# []=       def []=(x, y)           obj[x] = y      set
# <<        def <<(x)                               append
# <=>                                               spaceship operator: returns 1, 0, -1, or nil (if uncomparable)
# ==
# >
# <
# >=
# <=
# ===                                               case equality operator
# |
# &
# ^
# !         def !                   !obj or not obj

# note: can't override ||, &&, ||= or &&=