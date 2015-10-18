class Api::UsersController < Api::ApplicationController
  before_filter :authorize_admin

  def resource_class_name
    'user'
  end

  def bulk_add
    emails = params[:users]
    emails.each do |email|
      InvitationManager.invite_to_organization(current_user.organization, email)
    end
    head 200
  end

  def authorize_admin
    unless current_user && current_user.organization_admin
      head 401
    end
  end
end
