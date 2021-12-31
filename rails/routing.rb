
# commands

rails routes                            # list all routes in current app
rails routes | grep                     # search for specific routes

# config

resources :books                        # creates all the recular routes for a pluralized resource

resources :books do
  get "isbn"                            # creates a /isbn route for each book resource
end

# helpers

books_path                              # /books
book_path(book)                         # /book/1
edit_book_path(book)                    # /book/1/edit
new_book_path                           # /books/new
book_isbn_path(book)                    # /books/1/isbn