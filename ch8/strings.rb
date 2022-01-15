#!/usr/bin/env ruby

string = "hello world"
other = "i am a string"

both = string + other           # concatenate
other += " new additon"         # there's no append method
string.capitalize               # returns "Hello world"
string.capitalize!              # like above but modifies original string
string.downcase                 # convert to lowercase and return new string
string.downcase!                # convert to lowercase in place
string.gsub(/\d*/, "*")         # global substitution, replace all matches of that regex with the string provided
string.tr("he", "xx")           # basically find and replace, weired things if strings are different lengths