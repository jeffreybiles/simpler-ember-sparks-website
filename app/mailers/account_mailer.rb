class AccountMailer < ActionMailer::Base
  default from: "jeffrey@emberscreencasts.com"

  def set_password_email(user)
    @user = user
    @user.reset_invitation_token
    @host = if Rails.env == 'production' then 'www.emberscreencasts.com' else 'localhost:3000' end
    mail(to: @user.email, subject: "Set your emberscreencasts.com account password")
  end

  def reset_password_email(user)
    @user = user
    @user.reset_invitation_token
    @host = if Rails.env == 'production' then 'www.emberscreencasts.com' else 'localhost:3000' end
    mail(to: @user.email, subject: "Reset your emberscreencasts.com account password")
  end
end
