#!/usr/bin/ruby

# webpacker is a rails wrapper around webpack
# - replacement for sprockets?

# sprockets                 webpacker
# javascript_include_tag    javascript_pack_tag
# stylesheet_link_tag       stylesheet_pack_tag
# image_url                 image_pack_tag
# asset_url                 asset_pack_tag
# //= require               import or require


# files
# app/javascript            place for front-end JS
# config/webpacker.yml      webpacker config
# babel.config.js           babel js compiler config
# postcss.config.js         postcss config
# .browserslistrc           manage target browser config

# packs
# - any js file in the app/javascript/packs directory will get compiled into its own pack
# - application.js is default pack
# - packs usually are just a manifest and load other files

<%= javascript_pack_tag "application" %>