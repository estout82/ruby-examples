#!/usr/bin/env ruby

class Singleton
  def self.get_instance
    return @instance if @instance != nil
    @instance = Singleton.new
  end

  private

  def initialize
  end
end

singleton_one = Singleton.get_instance
singleton_two = Singleton.get_instance

# these will be equal
puts "one oid: #{singleton_one.object_id}"
puts "two oid: #{singleton_two.object_id}"
