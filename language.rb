#!/usr/bin/ruby

# outputs the bin dir (contains ruby binaries & cli tools)
puts RbConfig::CONFIG["bindir"]

# outputs the sruby std library path
puts RbConfig::CONFIG["rubylibdir"]

# gems ----
# the default gems directory is /gems at the same level as bin dir
# some default gems include rake, minitest, etc...

# loading external code ----
# library - external code written in ruby
# extension - external code written in c

load "./load_me.rb" # always loads the file (even if it's been loaded)
loaded_method

# loads the file, but doesn't re-load if its already been loaded
# - use this for loading 'features' and 'libraries' NOT files
# - treats .rb, .dll, .so files the same
require "./load_me"

# loades relative to the directory the file is in
require_relative "load_me"

# tools -----
# ruby - interpreter
# irb - interactive console
# rdoc & ri - doc tools
# rake - ruby make, defines tasks using little rubby scripts, run like 'rake db:migrate'
# gem - package manager
# erb - templating system