#!/usr/bin/env ruby

# feature envy - a method that would work better on a different class

# symptons
# - repeated references to the same object (should be a class)
# - params or local vars used more than instance or class vars
# - a class name is included in the name ex invite_user

# app/models/completion.rb
def score
    answers.inject(0) do |result, answer|
        question = answer.question
        result + question.score(answer.text)
    end
end