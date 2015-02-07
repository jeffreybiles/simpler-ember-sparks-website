class Post < ActiveRecord::Base
  scope :published, ->{where("publish_date <= ?", Date.today)}
  scope :recent_first, -> {order('publish_date DESC')}

  mount_uploader :thumbnail_image, ImageUploader

  acts_as_taggable
  has_permalink


  def free_days_remaining
   free_days = 7.days
   return (publish_date + free_days - Date.today).to_i
  end

  def in_trial_period
    free_days_remaining > 0
  end
end
