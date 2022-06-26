#
#
#

# Client
class Application
  def initialize(factory)
    @factory = factory
  end

  def render

    #
    # The client logic (here) can instantiate various objects without knowing their
    # precise types or instantiation logic. Also the dependency is explicit because
    # it is injected into the class via the initializer
    #
    factory.create_button.render
    factory.create_checkbox.render
  end
end

# Abstract factory
class GUIFactory
  def create_button; raise NotImplementedError; end
  def create_checkbox; raise NotImplementedError; end
end

# Concrete factory
class WinFactory < GUIFactory
  def create_button
    WinButton.new
  end

  def create_checkbox
    WinCheckbox.new
  end
end

# Concrete factory
class MacFactory < GUIFactory
  def create_button
    MacButton.new
  end

  def create_checkbox
    MacCheckbox.new
  end
end

# More classes..
# Button
# WinButton
# MacButton

# Checkbox
# WinCheckbox
# MacCheckbox