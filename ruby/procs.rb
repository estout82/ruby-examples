# a proc is basically a wrapper around a block

x = { puts "hi" }                 # invalid

x = Proc.new { puts "hi" }        # valid
x.call

x = lambda { puts "hi" }          # valid
x.call