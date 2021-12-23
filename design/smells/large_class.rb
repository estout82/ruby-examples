#!/usr/bin/env ruby

# things that indicate that a class is too long...
# - can't easily describe what the class does in one sentence
# - can't tell what the class does without scrolling
# - class needs to change for more than one reason
# - class has more than seven methods

# tips
# - take great care when refactoring public methods, it's harder to tell where they are used
#     - keep public interface small, 

# god class
# - usually the user and the focus class (for todo app, todo, etc..)
# - try and split into classes early