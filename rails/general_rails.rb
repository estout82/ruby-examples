#!/usr/bin/env ruby

# rails loads everything in the app/ directory automatically

Rails.env.production?                           # true if in production
Rails.env.development?                          # true if in development
Rails.env.test?                                 # true if in test