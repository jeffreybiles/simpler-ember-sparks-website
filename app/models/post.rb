class Post < ActiveRecord::Base
  default_scope {where("publish_date < ?", Date.today).order('publish_date DESC')}

  mount_uploader :thumbnail_image, ImageUploader
end
