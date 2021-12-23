
# defaults to :one = 0 :two = 2, etc..
enum column: [:one, :two, :three]

# has_many through
# - specifiy a relationthip "through" another relationship
has_many :join_tables
has_many :other_entity, through: :join_tables

# delegate
# - delegate instance methods to methods of other models

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