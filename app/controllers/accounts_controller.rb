class AccountsController < ApplicationController
  include Devise::Controllers::SignInOut
  # getting occasional errors without this
  skip_before_action :verify_authenticity_token, only: :subscribe



  def show
    redirect_to sales_path unless current_user
  end

  def subscribe
    user = current_user ||
           User.find_by(email: params[:email]) ||
           User.create(email: params[:email], password: params[:password])
    if user.subscribed
      flash[:warning] = "A user with the email address has already subscribed... please sign in!  Your current subscription will not change."
      redirect_to new_user_session_path
    else
      begin
        customer = Stripe::Customer.create(
          :source => params[:stripeToken],
          :plan => "pro_2",
          :email => user.email
        )
        user.update(stripe_customer_id: customer.id, subscribed: true)

        sign_in(user)
        ZapierRuby::Zapper.new(:signup).zap(email: user.email, subscribed: true)
        redirect_to thank_you_path
      rescue Stripe::StripeError => e
        flash[:danger] = "There was an error in Stripe: #{e}"
        redirect_to '/pay'
      rescue StandardError => e
        flash[:danger] = "There was an error: #{e}"
      end
    end
  end

  def unsubscribe
    begin
      StripeManager.unsubscribe(current_user)
      ZapierRuby::Zapper.new(:unsubscribe).zap(email: current_user.email)
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
