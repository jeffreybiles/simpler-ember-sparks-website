class Post < ActiveRecord::Base
  scope :published, ->{where("publish_date <= ?", Date.today)}
  scope :recent_first, -> {order('publish_date DESC')}

  mount_uploader :thumbnail_image, ImageUploader

  acts_as_taggable
  has_permalink

  def readable_time
    if seconds && seconds != 0
      "#{seconds/60}m#{seconds%60}s"
    end
  end
end
