
# defaults to :one = 0 :two = 2, etc..
enum column: [:one, :two, :three]

to_param        # override the id to something else

# has_many
has_many :join_tables
has_many :other_models, through: :join_tables                 # specifiy a relationship "through" another model
has_many :other_models, dependent: :destroy                   # when an associated record is delete, destroy is called on that record
has_many :other_models, dependent: :delete                    # same but the record is deleted directly from the db             
has_many :other_models, dependent: :destroy_async             # like destroy but ActiveRecord::DestroyAssociationAsyncJob is enqueued

# scope : simplify queries
scope :out_of_print, -> { where in_print: false }
scope :for_user, ->(for_user) { where user: for_user }

# delegate : delegate instance methods to methods of other models
class QueueItem < ActiveRecord::Base
    belongs_to :video

    delegate :category, to: :video, allow_nil: true # allow nil will prevent NoMethodError from being raised

    def category_name
        category.name # same as calling video.category.name
    end
end

class Video < ActiveRecord::Base
    has_many :queue_items
    belongs_to :category
end

# scope
# - define helper methods to simplify queries

class Person
    scope :alive, -> { where(dead: false, born: true) }
end

p = Person.new(person_fields)
p.alive? # call scope

#
# validators
#

include ActiveModel::Validations                                    # gives access to the validation helpers and methods
validates :terms_of_service, acceptance: true                       # validates that a checkbox on a form was checked
validates_associated :books                                         # validates associated models on save or validate
validates :email, confirmation: true                                # validates that email and email_confirmation contain exatly the same value
validates :start_date, comparison: { greater_than: :end_date }      # compares two comparable values
validates :subdomain, exclusion: {                                  # ensure values are not included in a given set
    in: %w(www us ca jp),
    message: "%{value} is reserved." 
}
validates :legacy_code, format: {                                   # ensure value matches a regex
    with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" 
}
URI::MailTo::EMAIL_REGEXP                                           # email regex
validates :size, inclusion: {                                       # ensure value is in a given set
    in: %w(small medium large),
    message: "%{value} is not a valid size" 
}
validates :name, length: { minimum: 2 }                             # validate length of enumables
validates :bio, length: { maximum: 500 }
validates :password, length: { in: 6..20 }
validates :registration_number, length: { is: 6 }
validates :points, numericality: true                               # ensure only integer values
validates :games_played, numericality: { only_integer: true }
validates :name, presence: true                                     # name is required - uses the present? method (nil, empty or whitespace string)
validates :name, :login, :email, absence: true                      # oposite of presence
validates :email, uniqueness: true                                  # validates that the value is unique before save (not guarenteed - use a db constraint)
validates :name, uniqueness: { 
    scope: :year,
    message: "should happen once per year"
}

class Person < ApplicationRecord
    validates_with GoodnessValidator                                        # pass record to seperate class to do validation
    validates_with GoodnessValidator, fields: [:first_name, :last_name]
end

class GoodnessValidator < ActiveModel::Validator
    def validate(record)
        if record.first_name == "Evil"
            record.errors.add :base, "This person is evil"
        end
    end
end
  
class Person < ApplicationRecord
    validates_each :name, :surname do |record, attr, value|                 # validates attributes agains a block
        record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
    end
end

# validates options
allow_nil: true                         # skip validation if record is nil
allow_blank: true                       # skip validation is blank? is true (empty string)
message: "%{value} is incorrect"        # pass a custom error message

on: :create                             # only execute on a certian operation
on: :update
person.valid?(:account_setup)
person.save(context: :account_setup)
on: :account_setup

# errors
model.errors.full_messages              # array with all friendly error messages
model.errors.full_messages_for(:name)   # array with full messages for a specific field
