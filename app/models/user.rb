class User < ActiveRecord::Base

  belongs_to :organization

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Stripe::Callbacks

  after_customer_updated! do |customer, event|
    user = User.find_by_stripe_customer_id(customer.id)
    if customer.delinquent
      user.subscribed = false
    else
      user.subscribed = true
    end
    user.save!
  end

  def can_watch_pro
    subscribed || (organization && organization.subscribed)
  end

  def organization_admin
    organization_permission_level == 'admin'
  end

  def reset_invitation_token
    self.invitation_token = SecureRandom.urlsafe_base64(15)
    self.save!
  end
end
