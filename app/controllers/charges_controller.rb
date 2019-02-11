class ChargesController < ApplicationController
  def new
    @amount = params[:amount]
    @description = params[:description]
  end

  def create
    # Amount in cents
    @amount = params[:amount]
    @description = params[:description]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
