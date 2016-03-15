require "test_helper"

class HomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "View Library"
    refute_content page, "Hello World!"
  end
end
