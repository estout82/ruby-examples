
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

# classes

class MyClass
    attr_accessor :val # create getter (val) and setter (val=)

    def initialize(val)
        self.val = val
    end
end

MyClass.superclass          # parent class (Object)
MyClass.class               # class of this object (Class) - classes are object w/ class = Class