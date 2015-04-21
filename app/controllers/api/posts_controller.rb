class Api::PostsController < Api::ApplicationController
  before_filter :authorize_admin, :except => [:index, :show]

  def resource_class_name
    'post'
  end
end
