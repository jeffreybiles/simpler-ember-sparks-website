class Tagging < ActiveRecord::Base
  after_update { if tag then tag.updated_publish_date end }
  after_destroy { if tag then tag.updated_publish_date end}

  belongs_to :tag, counter_cache: true
  belongs_to :post
end
