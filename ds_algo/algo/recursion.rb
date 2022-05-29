#!/usr/bin/env

# every recursive function has a base case and a recursive case

def look_for_key(box)
  return if box.items.empty? # also a base case (prevent infinite loop if box has no items)

  box.items.each do |item|
    if item.is_a? Box
      look_for_key(item) # recursive case
    elsif item.is_a? Key
      item # base case (found key)
    end
  end
end

parent_box = Box.new
parent_box.items << thing_one
parent_box.items << thing_two

child_box = Box.new
child_box.items << thing_one
child_box.items << thing_two
child_box.items << key

parent_box.items << child_box

key = look_for_key parent_box

if key.present?
  puts "key found!"
else
  puts "no key found :("
end