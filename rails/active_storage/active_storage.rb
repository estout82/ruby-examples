
has_one_attached :avatar                                    # gives model an avatar
has_one_attached :avatar, service: :cloudinary              # override default service
has_one_attached :avatar do |attachable|                    # define a variant
  attachable.variant :thumb, resize_to_limit: [100,100]
end
has_many_attached :images                                   # can have many images, can do every thing above

user.avatar.attach(params[:avatar])                         # attach avatar to existing user
user.avatar.attached?                                       # true if user has avatar attached

user.avatar.attach(                                         # attach a file from disk
  io: File.open("path/to/file"),
  filename: "readme.md",
  content_type: "text/markdown" # provide this when possible
)

user.avatar.attach(
  io: File.open("path/to/file"),
  filename: "readme.md",
  content_type: "text/markdown",
  identify: false # active storage won't try to identify content type from file
)

user.avatar.purge                                           # destroy avatar attachment AND file from storage service
user.avatar.purge_later                                     # purge with active job async instead

#
# redirect mode
# - request is redirected to the service URL by the RedirectController (even if it's local service)
#

url_for(user.avatar)                                        # a url for this blob (helper method) => /rails/active_storage/blobs/redirect/:signed_id/my-avatar.png
                                                            # - returns a permenant URL that redirects to the blob's RedirectController
                                                            # - the RedirectController redirects to the actual service endpoint (think mirroring services or migrating services)
                                                            # - link expires every 5 mins

rails_blob_path(user.avatar, disposition: "attachment")      # basically the same
rails_blob_url(user.avatar, disposition: "attachment")

Rails.application.routes.url_helpers.rails_blob_path(       # use the rails_blob_path ouside of a view
  user.avatar, 
  only_path: true
)

#
# proxy mode
# - rails acts as a proxy for service (served by service)
#

# TODO: learn more about this

config.active_storage.resolve_model_to_route = :rails_storage_proxy

rails_storage_proxy_path(user.avatar, disposition: "attachment")      # /rails/active_storage/blobs/proxy/:signed_id/my-avatar.png
rails_storage_proxy_url(user.avatar, disposition: "attachment")

#
# protected routes
#

# config/routes.rb
resource :account do
  resource :logo
end

# app/controllers/logos_controller.rb
class LogosController < ApplicationController
  # Through ApplicationController:
  # include Authenticate, SetCurrentAccount

  def show
    redirect_to Current.account.logo.url
  end
end

# app/views/logos.html.erb
image_tag account_logo_path

config.active_storage.draw_routes = false                             # disable default active storage routes

#
# direct uploads
# - upload directly from client to the service
#

# TODO:

# start the JS client library
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start();