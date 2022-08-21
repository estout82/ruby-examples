
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

#
# requests (integration tests)
#

post my_path, as: :json                 # submit a request as json
post my_path, as: :turbo_stream         # submit a request as turbo_stream

response.body                           # access response body after submitting a request
                                        # NOTE Nokogiri with error if the body is empty (in the
                                        # case of an empty turbo response for example)

assert_selector                         # assert css selector (ViewComponent::TestCase)
assert_select                           # assert css selector (ActionDispatch::IntegrationTest)