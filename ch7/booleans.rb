#!/usr/bin/ruby

# true and false are objects

true.class # TrueClass
false.class # FalseClass

# nil is false
# empty class definitions are false
# non-empty class definitions evaluate to the value of the last expression they contain
# method definitions are true
# strings are true
# [], 0, "", {} are true

# nil is an object

nil.class # NilClass

# testing equality