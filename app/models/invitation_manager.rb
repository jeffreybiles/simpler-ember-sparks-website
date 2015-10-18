class InvitationManager
  def self.invite_to_organization(current_organization, email)
    token = SecureRandom.base64(15)
    if user = User.find_by(email: email)
      # send an email asking if they'd like to join
      user.update_attributes(invitation_status: 'invited')
    else
      user = User.create(email: email,
                         password: token,
                         password_confirmation: token,
                         invitation_status: 'created')
    end
    user.update_attributes(
      invitation_token: token,
      organization_id: current_organization.id,
      organization_permission_level: 'user'
    )
  end
end
