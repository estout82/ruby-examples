
# operators

x ||= 10                        # set x to 10 if x is nil or false
x && = 100                      # set x to 100 if x isn't nil or false

# arrays

arr = []

arr.push("a")
arr.pop("a")

# objects

obj = Object.new # class method to create a new object

obj.to_s
obj.to_i
obj.freeze                      # prevent modification
obj.dup                         # create a duplicate, always unfrozen
obj.clone                       # create a duplicate, frozen state preserved
obj.is_a?(Object)
obj.respond_to?(:sym)           # t/f if an object responds (calls a method)
obj.object_id
obj.send(:sym)
obj.__send__(:sym)
obj.public_send(:sym)           # send a message to object, only include public methods
obj.methods                     # array with all methods
obj.method(:foo)                # return an object representing obj's method 'foo'
obj.method_missing(m, *args)    # called by Ruby when a method call on this object doesn't match any methods

# methods

m = obj.methods(:foo)

m.super_method                  # returns this method's super method

# classes

class MyClass
    attr_accessor :val # create getter (val) and setter (val=)

    def initialize(val)
        self.val = val
    end
end

MyClass.superclass          # parent class (Object)
MyClass.class               # class of this object (Class) - classes are object w/ class = Class
MyClass.ancestors           # all classes, superclasses, and modules that are a part of this class

# modules

module MyModule
    def method

    end
end

class OtherClass
    include MyModule        # include methods and instance vars in this class
    prepend MyModule        # include all of the above, but they take priority over classes methods and instance vars
    extend MyModule         # add methods and vars at class level (static)
end