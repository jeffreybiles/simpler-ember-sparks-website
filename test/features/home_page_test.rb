require "test_helper"

class HomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page.find_all('h1').first, "Twice-weekly screencasts"
    refute_content page, "Hello World!"
    assert_content page.find_by_id('newest_free_video'), "10: My last free video"
    assert_content page.find_by_id('newest_pro_video'), "11: My last pro video"
  end
end
