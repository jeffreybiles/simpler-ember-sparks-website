class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    gb = Gibbon::API.new()

    unless is_subscribed_to_mailchimp
      gb.lists.subscribe({id: "1f2540f1b1", email: {email: current_user.email}})
    end
  end

  def update
    super
  end

  def is_subscribed_to_mailchimp
    response = gb.lists.member_info({id: "1f2540f1b1", emails: [{email: current_user.email}]})
    return response['success_count'].try(:>, 0)
  end
end 