#!/usr/bin/env ruby

# software entities should be open for extension but closed (semi-closed) for modification
# - eg design your code to easily consume repolaceable parts

require "active_support"

# app/models/server.rb
class Server
  def initialize(provider)
    provider_klass = ActiveSupport::Inflector.constantize(
      "Provider::#{ActiveSupport::Inflector.classify(provider)}"
    )

    @provider = provider_klass.new
  end

  def provision
    @provider.create
    @provider.add_ssh_key
    @provider.status
  end
end

# app/providers/base.rb
module Provider
  class Base
    def initialize
      # shared logic
    end
  end
end

# app/providers/digital_ocean.rb
class Provider::DigitalOcean < Provider::Base
  def add_ssh_key
  end

  def create
  end

  def status
    "ok"
  end
end

# app/providers/aws.rb
class Provider::Amazon < Provider::Base
  def add_ssh_key
  end

  def create
  end

  def status
    "good"
  end
end

# --------------------------------------------
server = Server.new(:amazon)
status = server.provision
puts status