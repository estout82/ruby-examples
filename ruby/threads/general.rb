#
# Ruby uses GIL
#
# GIL - Global Interpreter Lock ... acts as a global mutex
#
# Mutex - Mutually exclusive flag. When two threads attempt to access the same resource,
# the thread first sets the mutex flag then does it's job and unsets the flag. If thread two
# attempts to access the resource protected by the mutex and sees that the flag is set, it
# will wait until the flag is not set and then access the resource.
# https://en.wikipedia.org/wiki/Mutual_exclusion
#

#
# Multi-Process Architecture
#

class MyClass
  def self.do_some_work
    puts rand(10) * rand(10)
  end
end

100.times do |i|
  # forks the currently running process, creating a new process with it's
  # own address space and a copy of all the memory
  fork do
    MyClass.do_some_work # do the work
    exit rand(10) # this is the exit code
  end

  puts Process.waitall # waits for all child processes to exit & returns an array of all process statuses
end
