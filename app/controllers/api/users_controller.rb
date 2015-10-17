class Api::UsersController < Api::ApplicationController
  before_filter :authorize_admin, :except => [:index, :show]

  def resource_class_name
    'user'
  end

  def authorize_admin
    unless current_user && current_user.organization_admin
      head 401
    end
  end
end
