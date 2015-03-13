class AccountsController < ApplicationController
  def show

  end

  def subscribe
    customer = Stripe::Customer.create(
      :card => params[:stripeToken],
      :plan => "pro",
      :email => current_user.email
    )
    current_user.update(stripe_customer_id: customer.id, subscribed: true)
    redirect_to 'show'
  end

  def unsubscribe
    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    customer.subscriptions.each do |subscription| #just in case we accidentally got 2 subscriptions
      customer.subscriptions.retrieve(subscription.id).delete
    end
    current_user.update(subscribed: false)
    redirect_to 'show'
  end
end