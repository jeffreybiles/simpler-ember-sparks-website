require 'test_helper'

class AuthenticationTest < Capybara::Rails::TestCase
  test "happy-path authentication flow (non-stripe)" do
    visit root_path
    assert page.has_content?('Subscribe to Pro')
    assert page.has_content?('Sign In')
    click_link 'Sign In'
    click_link 'Sign up'
    fill_in "user_email", with: "hallo@there.com"
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    assert page.has_content?('Welcome! You have signed up successfully.')
    assert page.has_content?('Subscribe to Pro')
    refute page.has_content?('Sign In')
    click_link "Sign Out"
    assert page.has_content?('Sign In')
    assert page.has_content?('Signed out successfully')
    click_link "Sign In"
    fill_in "user_email", with: 'hallo@there.com'
    fill_in "user_password", with: 'password'
    click_button "Sign in"
    refute page.has_content?("Sign In")
  end
end
