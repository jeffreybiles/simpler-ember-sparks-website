class RegistrationsController < Devise::RegistrationsController
  def create
    puts 'were in the create'
    super do |resource|
      ZapierRuby::Zapper.new(:signup).zap(email: resource.email, subscribed: false)
    end
  end
end
