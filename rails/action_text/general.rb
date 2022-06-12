
rails action_text:install                 # install action text

# javascript
# application.js
import "trix"
import "@rails/actiontext"

has_rich_text :content                    # adds a rich text field to the model

# <% form with: @model do |f| %>          # generates a form field with th trix editor
#  <%= f.rich_text_area :content %> 
# <% end %>

# <%= @message.content %>                 # render sanitized output
