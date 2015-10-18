class Organization < ActiveRecord::Base

  has_many :users

  include Stripe::Callbacks

  after_customer_updated! do |customer, event|
    organization = Organization.find_by_stripe_customer_id(customer.id)
    if customer.delinquent
      organization.subscribed = false
    else
      organization.subscribed = true
    end
    organization.save!
  end

  def admin_users
    users.where(organization_permission_level: 'admin')
  end
end
