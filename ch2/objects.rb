#!/usr/bin/ruby

require_relative "../helper"

obj = Object.new # creates a new 'generic' object

# obj.methods - array of all methods on an object
obj.methods.sort.each do |m|
    puts m
end

def obj.talk
    "im an object!"
end

print_divider("basic methods")

# obj.object_id - unique identifier assigned to object
puts "obj.object_id: #{obj.object_id}"

# obj.respond_to? - see if an object responds to a message (method call... sort of)
# - example of reflection (examine state of program while its running)
puts "obj.respond_to? talk: #{obj.respond_to? :talk}"
puts "obj.respond_to? speak: #{obj.respond_to? :speak}"

# obj.send(message) - sends a message to that object via a text string (call a method with text)
# - use  __send__ to avoid naming conflicts
# - can call private methods....uh oh
puts "obj.__send__(\"talk\"): #{obj.__send__("talk")}"

# public_send can only call public methods
puts "obj.public_send(\"talk\"): #{obj.public_send("talk")}"

b = BasicObject.new # basic objects can do basically nothing

print_divider("dupping & freezing")

old_obj = obj

new_obj = obj.dup # dup unfreezed frozen object

# prevent changes to this object
# - NOTE: elements insize a frozen array can be modified
new_obj.freeze

cloned_obj = new_obj.clone

puts "old_obj.object_id == obj.object_id: #{old_obj.object_id == obj.object_id}"
puts "new_obj.object_id == obj.object_id: #{new_obj.object_id == obj.object_id}"
puts "new_obj.frozen? #{new_obj.frozen?}"
puts "cloned_obj.frozen? #{cloned_obj.frozen?}" # still frozon