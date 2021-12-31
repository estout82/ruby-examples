#!/usr/bin/env

# concerns
# - a module that extends ActiveSupport::Concern
# - a 'mixin' that can be included in multiple models or controllers

# extract common logic so it can be re-used by 'mixing in'
# - avoid circular dependencies, the concern should NOT depend on the model that is including it
# - accoding to DHH, concerns depending on each other is ok
#    - just make a comment (see below)

module Trashable
    extend ActiveSupport::Concern

    included do
        scope :exisiting, -> { where(trashed: false) }
        scope :trashed, -> { where(trashed: true) }
    end

    def trash
        update_attribute :trashed, true
    end
end

class Comment < ApplicationRecord
    include Trashable

    include OtherModule # depends on Trashable
end