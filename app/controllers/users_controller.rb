class UsersController < ApplicationController
  def set_password
    @user = User.find_by(id: params[:user_id])
    check_token_match
    @user.update_attributes(invitation_status: 'accepted')
  end

  def activate_organization_user
    @user = User.find_by(id: params[:user_id])
    check_token_match
    if @user.update(password: params[:set_password][:password],
                 password_confirmation: params[:set_password][:password_confirmation])
      sign_in(@user)
      flash[:success] = "You have updated your password and logged in.  The entire library of videos is available to you now."
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render 'set_password'
    end
  end

  def accept_invitation
    @user = User.find_by(id: params[:user_id])
    check_token_match
    @user.update_attributes(invitation_status: 'accepted')
    StripeManager.unsubscribe(@user)
    sign_in(@user)
  end

  def check_token_match
    unless @user && (@user.invitation_token == params[:token])
      flash[:error] = "The user id and token did not match"
      redirect_to root_path and return
    end
  end
end
