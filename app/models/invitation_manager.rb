class InvitationManager
  def self.invite_to_organization(current_user, email)
    token = SecureRandom.base64(15).gsub('/', '')
    if invited_user = User.find_by(email: email)
      unless invited_user.organization_admin #security measure so malicious users don't snipe admins of other teams
        invited_user.update_attributes(invitation_status: 'invited',
                               invitation_token: token,
                               organization_id: current_user.organization_id,
                               organization_permission_level: 'user')
        UserInvitationMailer.accept_invitation_email(invited_user, current_user).deliver
      end
    else
      begin
        invited_user = User.create(email: email,
                           password: token,
                           password_confirmation: token,
                           invitation_status: 'created',
                           invitation_token: token,
                           organization_id: current_user.organization_id,
                           organization_permission_level: 'user')
        UserInvitationMailer.set_password_email(invited_user, current_user).deliver
      rescue StandardError
        # I know it's terrible just swallowing this, but it's better than it crashing everything else
        puts "There was an error"
      end
    end
  end
end
