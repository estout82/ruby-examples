
# helpers
# - a helper is a method that is motly used in a view to share re-usable code
# - put them in app/helpers
# - usually don't use helper methods from controller actions
#    - if you need to you can use the helpers object - helpers.time_ago_in_words(Time.now)
# - all helpers should have unique names
# - always pass data to helpers via params, NEVER use instance vars (it's confusing)

# when to create helpers?
# - when you have bits of GLOBAL logic that produce HTML: string formatting, conditional page elements

# app/helpers/application_helper.rb
module ApplicationHelper
    def word_of_the_day
        "Gorgonzola"
    end

    # takes a param not an instance var
    def custom_date_format(date)
        date.strftime("%B %Y")
    end
end

# app/controllers/home_controller.rb
class HomeController
    def index
        @length = helpers.word_of_the_day.count
    end
end

# app/views/home/index.html.erb
<div>
    <p>Word of the day: <%= word_of_the_day %></p>
</div>

# rails console
# - can call helpers from helpers.*

rails c
helpers.word_of_the_day

# time_ago_in_words
# - built in Rails helper

time_ago_in_words(Time.now) 
# output: less than a minute

# number_to_human
# - another rails build-in helper

number_to_human(10_000)
# output: 10 Thousand