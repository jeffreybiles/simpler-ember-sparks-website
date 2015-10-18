class StripeManager
  def self.unsubscribe(user)
    customer = Stripe::Customer.retrieve(user.stripe_customer_id)
    customer.subscriptions.each do |subscription| #just in case we accidentally got 2 subscriptions
      customer.subscriptions.retrieve(subscription.id).delete
    end
    user.update(subscribed: false)
  end

  def self.update_quantity(organization)
    customer = Stripe::Customer.retrieve(organization.stripe_customer_id)
    subscription = customer.subscriptions.first
    subscription.quantity = organization.users.count
    subscription.save
  end

  def self.create_invoice(organization)
    invoice = Stripe::Invoice.create(customer: organization.stripe_customer_id)
    invoice
  end
end
