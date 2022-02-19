
render :new                                                               # renders new view (new.html.erb)
render "products/show"                                                    # renders products controller show view
render inline: "<% products.each do |p| %><p><%= p.name %></p><% end %>"  # render some inline html
render json: @product                                                     # calls .to_json on @product
render xml: @product                                                      # calls .to_xml on @product

#
# partials
# - call render in a view and it will render a partial
#

render "menu"                                           # renders _menu.html.erb partial

# passes @new_customer into the partial as the object
# the object is the locla with the same name of the partial  (eg _user.html.erb => user)
render partial: "customer", object: @new_customer

# if @customer is a 'Customer', it will render _customer.html.erb and pass in 'customer' as a local
render @customer

# passes each element of products into _product.html.erb with the local named 'item'
render partial: "product", collection: @products, as: :item

# views/users/index.html.erb
render "shared/search_filters" do |form|
  <p>
    Name contains: <%= form.text_field :name_contains %>
  </p>
end

# views/shared/search_filters
<%= form_with model: search do |form| %>
  <h1>Search form:</h1>
  <fieldset>
    <%= yield form %>            # yields to the block passed in
  </fieldset>
  <p>
    <%= form.submit "Search" %>
  </p>
<% end %>
