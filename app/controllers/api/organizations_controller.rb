class Api::OrganizationsController < Api::ApplicationController
  before_filter :authorize_org_admin, except: [:create]

  def resource_class_name
    'organization'
  end

  def create
    @organization = Organization.create!(name: params[:organization][:name])
    @organization.update_attributes(
      stripe_customer_id: current_user.stripe_customer_id,
      subscribed: true
    )

    user = current_user
    user.update_attributes(
      organization_id: @organization.id,
      subscribed: false,
      organization_permission_level: 'admin'
    )
    render json: @organization
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
