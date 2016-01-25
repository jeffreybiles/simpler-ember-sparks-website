class Post < ActiveRecord::Base
  scope :published, ->{where("publish_date <= ?", Date.today)}
  scope :recent_first, -> {order('publish_date DESC')}
  scope :free, -> {where(free: true)}
  scope :pro, -> {where(free: false)}
  mount_uploader :thumbnail_image, ImageUploader

  has_permalink

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def readable_time
    if seconds && seconds != 0
      "#{seconds/60}m#{seconds%60}s"
    end
  end

end
