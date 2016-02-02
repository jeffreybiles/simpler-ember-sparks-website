require 'test_helper'
require 'stripe_mock'

class SubscriptionsTest < Capybara::Rails::TestCase
  setup do
    StripeMock.start
    @stripe_helper = StripeMock.create_test_helper
    @stripe_helper.create_plan(id: 'pro_2', amount: 995)
  end

  teardown do
    StripeMock.stop
  end

  # test "subscription flow happy path", subscribe, change cc, unsubscribe, resubscribe
  # Do this once we get a proper form
end
