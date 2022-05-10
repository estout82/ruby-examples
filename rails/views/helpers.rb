
string = "<p>hi</p>"
not_string = :some_thing

html_safe(string)                       # DANGEROUS: forces strings NOT to be escaped when inserting them
raw(not_string)                         # DANGEROUS: like not_string.to_s.html_safe
string.html_escape                      # OK
h(string)                               # OK: pretty sure this is like string.html_escape
sanitize(string)                        # GOOD: inserts as HTML SAFE html tags (like p, not script)
sanitize("<script>alert()</script>")    # GOOD: outpts "alert()" ... script tags are removed 


#
# ActionView::RecordIdentifier
#

# NOTE: calls Person#to_key to find what key to use
dom_id(Person.find(3))                  # => person_3