
string = "<p>hi</p>"
not_string = :some_thing

html_safe(string)                       # DANGEROUS: forces strings NOT to be escaped when inserting them
raw(not_string)                         # DANGEROUS: like not_string.to_s.html_safe
string.html_escape                      # OK
h(string)                               # OK: pretty sure this is like string.html_escape
sanitize(string)                        # GOOD: inserts as HTML SAFE html tags (like p, not script)
sanitize("<script>alert()</script>")    # GOOD: outpts "alert()" ... script tags are removed 

#
# ERB::Util (module)
#

html_escape "Moe's"                     # escape for html (html entities)
# => "Moe&#39;s"

#
# CGI (class)
#

CGI.escape "Moe's"                      # escape for URL
# => "Moe%27s"

#
# ActionView::RecordIdentifier
#

# NOTE: calls Person#to_key to find what key to use
dom_id(Person.find(3))                  # => person_3

# generates an anchor tag
link_to "View", post_path(@post)

# generates a mini-form with params
button_to "Create",
  posts_path,
  method: :post,
  form_class: "p-4",
  params: {name: "default name"}