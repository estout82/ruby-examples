#!/usr/bin/ruby

# private methods
# can only be called on self, and without an explicit reciever

class Signature
    def valid?
        validate # self.validate, no explicit reciever (ex: s.validate)
        self.value = 900 # = methods have to be called with self as reciever (other wise ruby thinks its a local var)
    end

    def value
        @value
    end

    private

    def value=(value)
        @value = value
    end

    def validate
        true
    end
end

s = Signature.new
puts "s.valid?: #{s.valid?}"
puts "s.value: #{s.value}"

# top-level methods
# - tl methods are deinfed as private instance methods on the Object class
# - have to be called without a reciever (bare-word style) b/c private
# - can be called anywhere b/c Object lines in lookup path

# these two definitions are the same
def hey

end

class Object
    private

    def hey

    end
end

# print all built-in top-level methods
Kernel.private_instance_methods.sort.each do |m|
    puts m
end