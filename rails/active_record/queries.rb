#!/usr/bin/env ruby

# .where.not - invert a where query
User.where.not(active: true) # get all inactive users