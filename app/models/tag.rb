class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  mount_uploader :thumbnail_image, ImageUploader

  has_permalink :name

  def seconds
    posts.pluck(:seconds).compact.sum
  end

  def readable_time
    if seconds && seconds != 0
      "#{seconds/60}m#{seconds%60}s"
    end
  end

  def updated_publish_date
    update_attribute(:most_recent_publish_date, posts.map(&:publish_date).max)
  end
end
