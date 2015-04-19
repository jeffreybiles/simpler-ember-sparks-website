class Api::PostsController < Api::ApplicationController
  def resource_class_name
    'post'
  end
end
