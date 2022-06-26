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