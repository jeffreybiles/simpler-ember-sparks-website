require 'test_helper'

class VideoViewPermissionsTest < Capybara::Rails::TestCase
  test "subscribed user" do
    create_user_and_login(subscribed: true)
    visit post_path(1)
    assert page.has_css?('#video-box')
    visit post_path(2)
    assert page.has_css?('#video-box')
  end

  test "unsubscribed user" do
    create_user_and_login(subscribed: false)
    visit post_path(1)
    assert page.has_css?('#video-box')
    visit post_path(2)
    refute page.has_css?('#video-box')
  end

  test "anonymous user" do
    visit post_path(1)
    assert page.has_css?('#video-box')
    visit post_path(2)
    refute page.has_css?('#video-box')
  end
end
