class UserInvitationMailer < ActionMailer::Base
  default from: "jeffrey@emberscreencasts.com"

  def set_password_email(invited_user, inviter)
    @user = invited_user
    @inviter = inviter
    @organization = inviter.organization
    @host = if Rails.env == 'production' then 'www.emberscreencasts.com' else 'localhost:3000' end
    mail(to: @user.email, subject: "#{@organization.name} has invited you to emberscreencasts.com")
  end
end
