class Tagging < ActiveRecord::Base
  after_save { tag.updated_publish_date }
  after_destroy { tag.updated_publish_date}

  belongs_to :tag, counter_cache: true
  belongs_to :post
end
