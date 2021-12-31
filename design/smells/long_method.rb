#!/usr/bin/env ruby

# things that can indicate a method is too long...
# - more than 1 level of nesting
# - more than 1 layer of abstraction
# - you can't tell what it does at a glance
# - flog score more than 10

# flog - a tool that helps analyze code quality

# example long method
def create
    @survey = Survey.find(params[:survey_id])
    @submittable_type = params[:submittable_type_id]
    question_params = params.
        require(:question).
        permit(:submittable_type, :title, :options_attributes, :minimum, :maximum)
    @question = @survey.questions.new(question_params)
    @question.submittable_type = @submittable_type

    if @question.save
        redirect_to @survey
    else
        render :new
    end
end

# solutions
# - extract method: break method into a mutiple methods

