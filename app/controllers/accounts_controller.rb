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
    render 'show'
  end
end