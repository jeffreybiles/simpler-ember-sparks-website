class Api::TagsController < Api::ApplicationController
  before_filter :authorize_admin, :except => [:index, :show]

  def resource_class_name
    'tag'
  end
end