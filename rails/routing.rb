
# commands

rails routes                            # list all routes in current app
rails routes | grep                     # search for specific routes

# config

# - resources

resources :books                        # creates all the recular routes for a pluralized resource

resources :books do
  get "isbn"                            # creates a /isbn route for each book resource
end

# - scope

scope :searchable do                    # like a controller concern, can inlclude in other resourceful routes
  resources :searches
end

scope :otherable ...

resources :books do
  concerns [:searchable, :otherable]    # creates sub routes from concerns /book/1/searches
end

# helpers

books_path                              # /books
book_path(book)                         # /book/1
edit_book_path(book)                    # /book/1/edit
new_book_path                           # /books/new
book_isbn_path(book)                    # /books/1/isbn