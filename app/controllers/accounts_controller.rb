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
      begin
        customer = Stripe::Customer.create(
          :card => params[:stripeToken],
          :plan => "pro_2",
          :email => user.email
        )
        user.update(stripe_customer_id: customer.id, subscribed: true)

        sign_in(user)
        AccountMailer.set_password_email(user).deliver

        redirect_to thank_you_path
      rescue Stripe::StripeError => e
        flash[:danger] = "There was an error in Stripe: #{e}"
        render 'show'
      end

    end
  end

  def unsubscribe
    begin
      Analytics.track(user_id: current_user.email, event: 'Unsubscribe')
      StripeManager.unsubscribe(current_user)
      redirect_to account_path
    rescue Stripe::StripeError => e
      flash[:danger] = "There was an error in Stripe: #{e}"
      render 'show'
    end
  end

  def change_credit_card
    begin
      customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
      card = customer.sources.create(source: params['stripeToken'])
      customer.default_source = card.id
      customer.save
      flash[:success] = "Changed credit card info"
      redirect_to account_path
    rescue Stripe::StripeError => e
      flash[:danger] = "There was an error in Stripe: #{e}"
      render 'show'
    end
  end

  def reset_password_through_email
    begin
      @user = current_user
      AccountMailer.reset_password_email(@user).deliver
      flash[:success] = "A link has been sent to #{@user.email}.  Click it to reset your password."
      redirect_to account_path
    rescue StandardError => e
      flash[:danger] = "There was an error.  Please contact jeffrey@emberscreencasts.com."
      redirect_to edit_user_registration_path
    end
  end
end
