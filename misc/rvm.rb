#!/usr/bin/ruby

# used to install multiple versions of the ruby runtime

rvm install 2.1.1                   # install version 2.1.1
rvm use 2.1.1                       # use version 2.1.1
rvm --default use 2.7.4             # use and set 2.7.4 as default ruby version
rvm list                            # list installed ruby versions
rvm use system                      # use the /usr/bin/ruby installed ruby instead

# gemsets: a container to keep gems seperate from eachother
# - change gems (or versions) without breaking all other projects

rvm gemset list                     # list all gemsets for the current ruby version
rvm gemset list_all                 # list gemsets for all ruby versions
rvm gemset create <name>            # create a new gemset for the current ruby version
rvm use gemset <name>               # use a gemset
rvm use 2.7.4@name                  # use a version and a gemset
rvm gemset empty <name>             # empty all gems out of a gemset
rvm gemset delete <name>            # delete a gemset
rvm gemset name                     # get the name of the current gemset
rvm @global do gem install <name>   # install a gem at the global level

# config files

.ruby-gemset                        # text file containing the name of the gemset
.ruby-version                       # text file containting the ruby version to use