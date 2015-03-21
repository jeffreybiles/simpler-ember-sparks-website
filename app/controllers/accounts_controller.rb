class AccountsController < ApplicationController
  include Devise::Controllers::SignInOut

  def show

  end

  def subscribe
    user = User.find_by(email: params[:stripeEmail]) ||
      user = User.create(email: params[:stripeEmail], password: 'temporaryPassword')

    if user.subscribed
      flash[:warning] = "A user with the email address has already subscribed... please sign in!  Your current subscription will not change."
      redirect_to new_user_session_path
    else
      customer = Stripe::Customer.create(
        :card => params[:stripeToken],
        :plan => "pro_2",
        :email => user.email
      )
      user.update(stripe_customer_id: customer.id, subscribed: true)

      sign_in(user) unless current_user

      redirect_to account_path
    end
  end

  def unsubscribe
    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    customer.subscriptions.each do |subscription| #just in case we accidentally got 2 subscriptions
      customer.subscriptions.retrieve(subscription.id).delete
    end
    current_user.update(subscribed: false)
    redirect_to account_path
  end
end