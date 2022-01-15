#!/usr/bin/env ruby

# every module or class shoold have resopnsibility over a single part of the functiuonality 
# and that responsibility should be entirely encapsulated

# app/models/server.rb
class Server < ApplicationRecord
  has_many :apps
  validates :name, presence: true
end

# app/scripts/app/deploy.rb
class App::Deploy
  def perform
    # could do this in parallell or serial (below), all details have been abstracted and each class is
    # responsible for one piece of the functionality puzzle
    app.server.each do |server|
      Server::Deploy.new(server).perform
    end
  end
end

# app/scripts/server/setup.rb
class Server::Setup < Server::SSH
  def perform
    start_ssh self, as: "root" do |ssh|
      ssh.execute "apt install ruby"
      ssh.execute "git clone https://git.githiub.com/user/repo.git"
    end
  end
end

# app/scripts/server/deploy.rb
class Server::Deploy < Server::SSH
  def deploy
    start_ssh self, as: "root" do |ssh|
      ssh.execute "cd repo"
      ssh.execute "git remote update"
      ssh.execute "touch tmp/restart.txt"
    end
  end
end

# app/scripts/server/ssh.rb
class Server::SSH
  def start_ssh &block
    Net::SSH.start self.ip do |ssh|
      block.call ssh
    end
  end
end