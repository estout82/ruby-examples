#
# general info on software design
#
# NOTE good practice (eg SOLID) reveals design
#

#
# depend on behavior, not data
# - eg. tell, don't ask
#

# BAD
if gear.ratio == 4
  torque = :high
end

# GOOD - depends on behavior not data
torque = gear.get_torque

#
# hide instance variables (even from the classes that define them)
# - allows for easily changing implementation
#

# BAD
class Bread
  def initialize
    @grain = :wheat
  end

  def cook
    if @grain == :wheat
      # ...
    end
  end
end

# GOOD
class Bread
  private

  attr_reader :grain # NOTE now you can change this easily

  public

  def initialize
    grain = :wheat
  end

  def cook
    if grain == :wheat
      # ...
    end
  end
end

#
# hide data structures
# - depending on data structures is much worse than depending on instance variables
# - use structs
#

# BAD
class Car
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # NOTE this is really bad
  def diameters
    # [0] is rim, [1] is tire
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end
end

# GOOD
class Car
  attr_reader :wheels

  def initialize(data)
    wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  Wheel = Struct.new :rim, :tire

  private

  def wheelify(data)
    data.map { |cell| Wheel.new cell[0], cell[1] }
  end
end

#
# use structs as mini classes
# - can help follow the SRP by extracting functionality without committing to
#   a new class entirely
#

class Gear
  attr_reader :chain_ring, :cog, :wheel

  def initialize(chain_ring, cog, rim, tire)
    @chain_ring = chain_ring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end

  def ratio
    chain_ring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  # GOOD used as a mini class
  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end
