class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  def seconds
    posts.pluck(:seconds).sum
  end

  def readable_time
    if seconds && seconds != 0
      "#{seconds/60}m#{seconds%60}s"
    end
  end

end
