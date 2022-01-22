
#
#
#

assert

assert_not

assert_response :success
assert_response :error
assert_response :redirect
assert_response :missing
assert_response 401

assert_redirected_to root_path
assert_redirected_to controller: "home", action: "index"
assert_redirected_to @customer

assert_nothing_raised

assert_enqueued_emails 3

assert_enqueued_email_with TeamEventsMailer, :new_member, args: [@user, @team.owner]

#
# conventions
#

# .method implies class method
# #method implies instance method