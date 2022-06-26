#
# dependencies are how objects access functionality encapsulated in other objects
# - an object depends on another object if when that object changes the other may
#   be forced to change
#
# ways a class can depend on another
# - knowing the name of another class
# - knowing the name of a message it intends to something other than self
# - knowing the args of that message
# - knowing the order of the args for that message
#

#
# inject dependencies
#

class Gear
  attr_reader :chain_rig, :cog, :wheel

  def initialize(chain_rig, cog, wheel)
    @chain_ring = chain_rig
    @cog = cog
    @wheel = wheel # the wheel dependency is injected in
  end

  def inches
    ratio / wheel.diameter
  end
end

# utilize duck typing (eg responds to diameter) to inject Wheel dependency
gear = Gear.new 1, 2, Wheel.new(2, 3)

#
# isolate dependencies
# - use this when you cannot change the code to eliminate dependencies (eg above)
# - this means dependencies will be obvious and can change easily later
#

class Gear
  attr_reader :chain_rig, :cog, :wheel

  def initialize(chain_rig, cog, wheel, rim, tire)
    @chain_ring = chain_rig
    @cog = cog

    # shows classes depencendy on wheel and doesn't lie in the constructor anymore
    # also not a law of demeter violation anymore
    @wheel = Wheel.new(rim, tire)
  end

  def inches
    ratio / wheel.diameter
  end
end
