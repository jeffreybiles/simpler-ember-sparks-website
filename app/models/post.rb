class Post < ActiveRecord::Base
  include AlgoliaSearch
  
  after_save { tags.map(&:updated_publish_date) }
  after_destroy { tags.map(&:updated_publish_date)}

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
  
  algoliasearch per_environment: true do
    attributesToIndex [:publish_date, :title, :description, :transcript]
    customRanking ["desc(publish_date)"]
    
    attribute :title, :description, :transcript,
      :publish_date, :links, :permalink,
      :free, :difficulty, :seconds
    attribute :thumbnail_image_url do
      thumbnail_image.url
    end

    add_slave 'Post_by_publish_date_asc', per_environment: true do
      customRanking ["asc(publish_date)"]
    end

    add_slave 'Post_by_publish_date_desc', per_environment: true do
      customRanking ["desc(publish_date)"]
    end
  end
end
