#!/usr/bin/env ruby

# presenters
# - use these to encapsulate complex conditionals & formatting methods for views
# - use when helpers don't cut it

# app/presenters/post_presenter.rb
class PostPresenter
    def initialize(post)
        @post = post
    end

    def title_without_forbidden_words
        @post.title.gsub("bad word", "")
    end

    def css_color
        @post.draft? ? "orange" : "green"
    end
end

# removed logic from view
# gave meaningful names to values
# can re-use class in other views (maybe home page has a list of posts, etc...)

# app/views/posts/show.html.erb
<% presenter = PostPresenter.new(@post) %>
<p>
  Post title: <%= presenter.title_without_forbidden_words %>
  <%= link_to "Read post", post, class: "w-75 p-3 text-#{presenter.css_color} border-#{presenter.css_color}" %>
</p>