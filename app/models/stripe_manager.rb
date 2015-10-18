class StripeManager
  def self.unsubscribe(user)
    customer = Stripe::Customer.retrieve(user.stripe_customer_id)
    customer.subscriptions.each do |subscription| #just in case we accidentally got 2 subscriptions
      customer.subscriptions.retrieve(subscription.id).delete
    end
    user.update(subscribed: false)
  end
end
