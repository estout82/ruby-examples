#!/usr/bin/env ruby

string = "hello world"
other = "i am a string"

both = string + other           # concatenate
other += " new additon"         # there's no append method
string.capitalize               # returns "Hello world"
string.capitalize!              # like above but modifies original string