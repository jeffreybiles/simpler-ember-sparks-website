class Tagging < ActiveRecord::Base
  belongs_to :tag, counter_cache: true
  belongs_to :post
end
