require "test_helper"

class HomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Twice-weekly screencasts"
    refute_content page, "Hello World!"
  end
end
