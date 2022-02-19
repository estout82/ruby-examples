#!/usr/bin/env ruby

user = User.first

user.try(:email)                                        # returns nil if attribute doesn't exist
user.nil?                                               # is this record nil?

User.where.not(active: true)                            # get all inactive users

User.none                                               # an empty ActiveRecord::Relation

user.authors.loaded?                                    # tells you if the association has already been loaded

#
# where
#

# - where ALWAYS triggered a SQL call even when association is loaded
#   - use loaded? and ruby enumerable detech (find) to filter with enumerable

User.where(id: 10)

#
# detect
#

#
# includes
#

# loads all the associations with the least amount of queries possible
Customer.includes(orders: {books: [:supplier, :author]})

#
# merge
# - merge scopes from other models when joining
#

Author.joins(:books).merge(Book.available)              # all authors with available books