class Api::PostsController < Api::ApplicationController
  before_filter :authorize_admin, :except => [:index, :show]

  def resource_class_name
    'post'
  end

  def update
    save_image
    resource.update_attributes(resource_params)
    render json: resource
  end

  def create
    @resource = resource_class.send(:create, resource_params)
    save_image
    render json: @resource
  end

  def save_image
    uploader = ImageUploader.new(resource, :post)
    uploader.store!(params['post']['thumbnail_image'])
    resource.thumbnail_image = uploader.file
    resource.save!
  end
end
