#
# metaclass
#
# - a class is an object that defines a blueprint to make other objects
# - a class stores its instance methods in its method table
#   - NOTE: class methods are not added to the instance's method table
#

# each object has a hidden 'metaclass' which is a singleton for that instance
# - each instance has the same class but different metaclasses (singleton_class)
# - same object, same metaclass
jim.singleton_class     # => #<Class:#<User:0x00007fb71a9a2cb0>>
robert.singleton_class  # => #<Class:#<User:0x00007fb71a9a2c60>>
tom.singleton_class     # => #<Class:#<User:0x00007fb71a9a2c10>>

# when defining a method and passing a receiver, the new method is defined on 
# the object's metaclass instead of method table
# - think of metaclass like flexible class
def jim.last_name
  "bob"
end

# works the same for class methods
# User.all_count => 3
class User
  def self.all_count
    self.all.count
  end
end

#
# User ( is Class object )
# - self -> points to the object that is stored in the constant "User"
# - self is User
# - User is an object stored in a constant, we access the same object with
#   self (which has the same metaclass)
#
# - class methods are methods on the class object's metaclass
#

# NOTE: these two examples are equivalent
class User
  class << self # open the current class's meta class
    def all_jim
      self.where name: "jim"
    end
  end
end

class User
  def self.all_jim
    self.where name: "jim"
  end
end

#
# instance_eval
#

class User
  instance_eval do
    self # => User

    # will be an instance method of User
    def name
    end
  end
end