#!/usr/bin/env ruby

# details shound depend on abstraction, abstraction should NOT depend on details
# - in rails this basically means passing things as params into methods instead of building or referring
#   to them in the body of a method

require "active_support"

module Hosting
  def self.create_provider(provider_name)
    # fancy replacement for a switch case
    classified_provider_name = ActiveSupport::Inflector.classify(provider_name)

    ActiveSupport::Inflector.constantize(
      "Hosting::#{classified_provider_name}"
    )
  rescue NameError
    raise InvalidProviderError, "there is no provider with name #{provider_name.to_s}"
  end

  class InvalidProviderError < StandardError
  end

  class DigitalOcean
    def create_server(params)
      # some logic to use digital ocean's API here
      "created a digital ocean server : #{params[:name]}"
    end
  end

  class Linode
    def create_server(params)
      # some logic to create a linode server here
      "created a linode server : #{params[:name]}"
    end
  end
end

module Server
  class Create
    def initialize(params)
      @params = params
    end

    def perform(provider) # this method depends on abstraction (eg method param)
      # provider = Hosting.create_provider(:digital_ocean) : BAD... this method depends on non-abstraction now
      provider.new.create_server(@params)
    end
  end
end

provider = Hosting.create_provider(:digital_ocean)
server_creator = Server::Create.new({name: "test server"})
server = server_creator.perform(provider)

puts server   # => created a digital ocean server : test server

# use this to test the providers : all this lives in the test suite
class FakeProvider
  def create_server(params)
    "created a fake server : #{params[:name]}"
  end
end