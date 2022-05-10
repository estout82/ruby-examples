#!/usr/bin/env ruby

user = User.first

user.try :email                                           # returns nil if attribute doesn't exist
user.nil?                                                 # is this record nil?
user.blank?                                               # NOTE: better -> from ActiveSupport

User.where.not(active: true)                              # get all inactive users

User.none                                                 # an empty ActiveRecord::Relation

user.loaded?                                              # returns true if record has been loaded
user.authors.loaded?                                      # returns true association has been loaded

User.where(id: 10)                                        # ALWAYS triggered a SQL call even when association is loaded

Customer.includes(orders: {books: [:supplier, :author]})  # loads all the associations with the least amount of queries possible

Author.joins(:books).merge(Book.available)                # merge scopes from other models when joining - all authors with available books

Book.first.becomes OldBook                                # returns an instance of OldBook with the attributes from the instance of Book
                                                          # - helpful for STI

Book.first.becomes! OldBook                               # same as above but actually modifies the STI type column

#
# batches
#
# NOTE: default batch size is 1000
#

User.find_each { |u| u.process_something }                # will use find_in_batches to process each record
                                                          # NOTE: this seems to be most efficient

User.find_in_batches do |batch|                           # process records in batches
  batch.each { |u| u.process_something }
end

User.where(name: "jim").in_batches do |batch|             # batch a regular query
  batch.each { |u| u.process_something }
end