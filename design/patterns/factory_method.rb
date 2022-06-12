#
# Define an interface for creating an object, but let the subclasses decide which
# class to instantiate.
#

# Creator
class Dialog
  def render
    puts "Rendering dialog"

    #
    # GOOD - Can render button in Creator object without knowing exactly which
    # class to instantiate. That is done by the sub class.
    #
    button = create_button
    button.render
  end

  #
  # This is the factory method. Instead of doing some switch case or simulated
  # polymorphism, we can simply can WindowsDialog.new.create_button or the like
  # for a web dialog. This simplifies code and moves what would have been
  # in the if statement to polymorphism.
  #
  def create_button
    raise NotImplementedError
  end
end

# Concrete creator
class WindowsDialog < Dialog
  def create_button
    WindowsButton.new
  end
end

# Concrete creator
class WebDialog < Dialog
  def create_button
    HTMLButton.new
  end
end

# Product
class Button
  def render
    raise NotImplementedError
  end

  def click
    raise NotImplementedError
  end
end

# Concrete product
class WindowsButton < Button
  def render
    puts "Rendering a windows button"
  end

  def click
    puts "Clicked a windows button"
  end
end

# Concrete product
class HTMLButton < Button
  def render
    puts "Rendering a HTML button"
  end

  def click
    puts "Clicked a HTML button"
  end
end