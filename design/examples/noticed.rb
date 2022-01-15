#!/usr/bin/env ruby

require "active_support/all" # for class_attribute

# in the gem
module Noticed
  class Base
    class_attribute :delivery_methods, instance_writer: false, default: []

    attr_accessor :message

    def self.deliver_by(name, options = {})
      self.delivery_methods << name
    end

    def self.inherited(base) # called whenever this class is inherited from
      # base is passed in by ruby (it's the class that is inheriting from this class)
      base.delivery_methods = delivery_methods.dup # basically set the new class's delivery methoods to this classes delivery methods
      super # then call this method in the base class
    end

    def deliver
      delivery_methods = self.class.delivery_methods

      delivery_methods.each do |delivery_method|
        klass = case delivery_method
        when String, Symbol
          "Noticed::DeliveryMethods::#{delivery_method.to_s.classify}".constantize
        when Object
          delivery_method
        end

        klass.new.deliver(message)
      end
    end
  end

  module DeliveryMethods
    class Base
      def deliver(message)
        raise NotImplementedError
      end
    end

    class Database < Base
      def deliver(message)
        puts "delivered a database notification: #{message}"
      end
    end

    class ActionCable < Base
      def deliver(message)
        puts "delivered an action cable notification: #{message}"
      end
    end

    class Email < Base
      def deliver(message)
        puts "delivered an email notification: #{message}"
      end
    end
  end
end

# app/notifications/delivery_methods/discord.rb
class Discord < Noticed::DeliveryMethods::Base
  def deliver(message)
    puts "delivered a discord notification: #{message}"
  end
end

# app/notifications/application_notification.rb
class ApplicationNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable
end

# app/notifications/note_notification.rb
class NoteNotification < ApplicationNotification
  deliver_by :email

  def initialize(message: "")
    self.message = message
  end
end

# app/notifications/schedule_notification.rb
class ScheduleNotification < ApplicationNotification
  deliver_by Discord

  def initialize(message: "")
    self.message = message
  end
end

# some where in the code
notification = NoteNotification.new(message: "A new note was created!")
notification.deliver

schedule_notification = ScheduleNotification.new(message: "A new schedule was created!")
schedule_notification.deliver