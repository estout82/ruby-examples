#!/usr/bin/env ruby

user = User.first

user.try(:email)                                        # returns nil if attribute doesn't exist
user.nil?                                               # is this record nil?

# .where.not - invert a where query
User.where.not(active: true) # get all inactive users