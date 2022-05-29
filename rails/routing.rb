
# commands

rails routes                            # list all routes in current app
rails routes | grep                     # search for specific routes

# config

# - resources

resources :books                        # creates all the recular routes for a pluralized resource

resources :books do
  collection do
    get "/all"                          # creates /books/alll => all_books_path
  end

  member do
    get "/isbn"                         # creates /books/:id/isbn => isbn_book_path
  end
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

include Rails.application.routes.url_helpers # include this module to use them outside of views & controllers

books_path                              # /books
book_path(book)                         # /book/1
edit_book_path(book)                    # /book/1/edit
new_book_path                           # /books/new
book_isbn_path(book)                    # /books/1/isbn

# NOTE rails will add _index to the index action of non-pluralized resources
# eg  user#index  -> user_index_path
#     users#index -> users_path