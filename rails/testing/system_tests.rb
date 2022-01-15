
visit root_url

assert_selector "h2", text: "Some Text"

fill_in "Password", with: "1234"

click_on "Log In"

assert_current_path                                                     # asserts that this is the current path
assert_no_current_path login_path                                       # asserts that this isn't the current path

click_button "avatar-link"                                              # clicks on a button with that ID

using_session "session_a" do ... end                                    # use to compare 2 different sessions
using_session "session_b" do ... end