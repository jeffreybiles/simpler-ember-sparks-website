require 'test_helper'
require 'stripe_mock'

class AccountsControllerTest < ActionController::TestCase
  def setup
    StripeMock.start
    @stripe_helper = StripeMock.create_test_helper
    @stripe_helper.create_plan(id: 'pro_2', amount: 995)
  end

  teardown do
    StripeMock.stop
  end

  test "happy path subscription" do
    post :subscribe, stripeEmail: "example@test.com",
                     stripeToken: @stripe_helper.generate_card_token
    assert_redirected_to thank_you_path
  end
end
