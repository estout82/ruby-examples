#!/usr/bin/env ruby

# service objects
# - a ruby module which encapsulates logic about comlpeting an operation
# - send a tweet, generate pdf, etc...

# app/services/twitter_service.rb
def TwitterService
    # this is the operation to be completed
    def self.send_welcome_message(twitter_handle)
        client.update("@#{twitter_handle} welcome to 'Oranges & Apples', we hope you enjoy our juicy fruit!")
    end

    def self.client
        @client ||= Twitter::REST::Client.new do |config|
            config.consumer_key        = "..."
            config.consumer_secret     = "..."
            config.access_token        = "..."
            config.access_token_secret = "..."
        end
    end
end