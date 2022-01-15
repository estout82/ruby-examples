
gem install activesupport                       # install active support without rails
require "active_support"                        # can use methods like ActiveSupport::Inflectors#classify
                                                # - also need to call this before requiring anything below
require "active_support/all"                    # load all of ActiveSupport
require "active_support/core_ext"               # load all core extensions to everything (Array, Hash, String, etc..)
require "active_support/core_ext/hash"          # load all core extensions for hash