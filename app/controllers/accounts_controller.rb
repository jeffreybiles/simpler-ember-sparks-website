class AccountsController < ApplicationController
  include Devise::Controllers::SignInOut

  def show
    if current_user.andand.subscribed
      Analytics.track(user_id: current_user.email, event: 'Viewed Account Page')
    else
      Analytics.track(anonymous_id: session.id || 'new', event: 'Viewed Subscription Page')
    end
  end

  def subscribe
    user = current_user ||
           User.find_by(email: params[:stripeEmail]) ||
           User.create(email: params[:stripeEmail], password: 'temporaryPassword')
    if user.subscribed
      Analytics.track(user_id: user.email, event: 'Double-Subscription attempt')
      flash[:warning] = "A user with the email address has already subscribed... please sign in!  Your current subscription will not change."
      redirect_to new_user_session_path
    else
      Analytics.alias(previous_id: session.id, user_id: user.email)
      Analytics.track(user_id: user.email, event: 'Subscription')
      customer = Stripe::Customer.create(
        :card => params[:stripeToken],
        :plan => "pro_2",
        :email => user.email
      )
      user.update(stripe_customer_id: customer.id, subscribed: true)

      sign_in(user)

      redirect_to thank_you_path
    end
  end

  def unsubscribe
    Analytics.track(user_id: current_user.email, event: 'Unsubscribe')
    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    customer.subscriptions.each do |subscription| #just in case we accidentally got 2 subscriptions
      customer.subscriptions.retrieve(subscription.id).delete
    end
    current_user.update(subscribed: false)
    redirect_to account_path
  end

  def change_credit_card
    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    card = customer.sources.create(source: params['stripeToken'])
    customer.default_source = card
    customer.save
    flash[:success] = "Changed credit card info"
    redirect_to account_path
  end
end
