class Api::UsersController < Api::ApplicationController
  before_filter :authorize_org_admin

  def resource_class_name
    'user'
  end

  def bulk_add
    emails = params[:users]
    emails.each do |email|
      InvitationManager.invite_to_organization(current_user, email)
    end
    StripeManager.update_quantity(current_user.organization)
    invoice = StripeManager.create_invoice(current_user.organization)
    invoice.pay
    head 200
  end

  def index
    users = current_user.organization.users
    render json: users
  end

  def show
  end

  def update
  end

  def destroy
  end

  def authorize_org_admin
    unless current_user && current_user.organization_admin
      head 401
    end
  end
end
