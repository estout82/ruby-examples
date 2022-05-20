#
# encapsulation : bundle data and the methods that operate upon it into a single object
#

# BAD
# those methods belong together because they act on the same data

def create(title)
end

def delete(title)
end

def read(title)
end

# GOOD
# data and methods are encapsulated

class Thing
  def initialize(title)
    @title = title
  end

  def create()
  end

  def delete()
  end

  def read()
  end
end