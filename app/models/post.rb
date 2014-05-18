class Post < ActiveRecord::Base
  scope :published, ->{where("publish_date <= ?", Date.today)}
  scope :recent_first, -> {order('publish_date DESC')}

  mount_uploader :thumbnail_image, ImageUploader

  acts_as_taggable
end
