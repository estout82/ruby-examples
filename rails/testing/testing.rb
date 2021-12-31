
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