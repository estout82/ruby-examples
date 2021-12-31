
rails routes                            # list all routes in current app
rails routes | grep                     # search for specific routes

resources :books                        # creates all the recular routes for a pluralized resource

resources :books do
  get "isbn"                            # creates a /isbn route for each book resource
end