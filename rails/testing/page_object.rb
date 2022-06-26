#
# used to simplify interaction with page (html) in tests
#

# test/system/thing_test.rb
class ThingTest < ActionDispatch::SystemTest
  test "thing is cancelled" do
    thing_page = Helpers::ThingPage.new "title"
    thing_page.create
    thing_page.cancel!

    assert thing_page.canceled?
  end
end

# test/helpers/pages/thing_page.rb
class Helpers::ThingPage
  def initialize(title)
    @title = title
  end

  def create!
    visit thing_path
    fill_in :thing_title, @title
    click_on "Create Thing"
  end

  def cancel
    visit thing_path(title: @title)
    click_on "Cancel Thing"
  end

  def canceled?
    assert_flash text: "Thing Cancelled"
  end

  def exists?
    assert_flash text: "Thing Created"
  end

  private

  def assert_flash(text:)
    assert_select "p.flash", text:
  end
end