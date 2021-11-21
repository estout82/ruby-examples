#!/usr/bin/ruby

# local variables start with lowercase letter
x = 10
my_str = "I am a string"

# globals start with $ and should be uppercased
# constants also being with an uppercase
$GL = "I am a global string"

class Test
    # class (static) variables start with @@
    @@my_static = "I am a string"

    def initialize
        # instance variables start with an @
        @my_inst_str = "I am a string"
    end
end

# conver string to int
my_int = "100".to_i

# convert int to string
my_string_from_int = 100.to_s