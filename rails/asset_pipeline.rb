#!/usr/bin/ruby

# asset pipeline
# - a framework to concatenate and minify assets
# - implemented with the sprockets-rails gem

rails new appname --skip-sprockets # create a new project without asset pipeline

# features
# 1. concatenate assets - reduces the amout of requests browsers have to make
# 2. minifies assests
# 3. fingerprints assets

# pre-compiling
# - in production some assets (like CSS and JS) are pre-compiled
# - NOTE: in dev assets are compiled on demand
# - asset pipeline will take all assets set to pre-compile (in asset.rb initializer), compile them if it knows how
#   and place the compiled and finger printed versionin public/assets
# - then you can use asset_path, stylesheet_link_tag, or javascript_include_tag helpers to generate links to these assets
# IMPORTANT
# - app/assets/javascripts, app/assets/images, app/assets/stylesheets are the only dirs that are in search paths (add app/assets/builds)
# - add all assets that aren't images, application.{css|js} to be pre-compiled
# - NEVER set assets.compile = true in prod

# webpacker is a rails wrapper around webpack
# sprockets serves static files

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