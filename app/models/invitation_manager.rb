class InvitationManager
  def self.invite_to_organization(current_user, email)
    token = SecureRandom.base64(15).gsub('/', '')
    if invited_user = User.find_by(email: email)
      # send an email asking if they'd like to join
      invited_user.update_attributes(invitation_status: 'invited',
                             invitation_token: token,
                             organization_id: current_user.organization_id,
                             organization_permission_level: 'user')
    else
      invited_user = User.create(email: email,
                         password: token,
                         password_confirmation: token,
                         invitation_status: 'created',
                         invitation_token: token,
                         organization_id: current_user.organization_id,
                         organization_permission_level: 'user')
      UserInvitationMailer.set_password_email(invited_user, current_user).deliver
    end
  end
end
