#!/usr/bin/ruby

require_relative "../helper"

# re-assigning constants is a warnable offense
# - making this impossible could present issuse since ruby is dynamically typed
# - (loadig files, re-use in a different scope, etc)
A = 1
A = 2

ARR = [1, 2, 3, 4]

# this will not cause a warning b/c we are modifying the object to which the constant referrs
# - if we were to change the object to which the constant refers, that would cause a warning
ARR << 5

puts ARR.to_s