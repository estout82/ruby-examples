require "active_support"

module Contentable
  extend ActiveSupport::Concern

  included do |mod|
    @@types ||= []
    @@types << mod
  end

  def self.valid_types
    @@types
  end
end

class Lesson
  include Contentable
end

class Playlist
  include Contentable
end

puts Contentable.valid_types
