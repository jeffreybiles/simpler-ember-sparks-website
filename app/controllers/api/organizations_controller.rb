class Api::OrganizationsController < Api::ApplicationController
  before_filter :authorize_admin, :except => [:index, :show]

  def resource_class_name
    'organization'
  end

  def authorize_admin
    unless current_user && current_user.organization_admin
      head 401
    end
  end
end
