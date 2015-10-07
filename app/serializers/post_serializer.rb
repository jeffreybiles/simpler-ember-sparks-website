class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :transcript, 
              :publish_date, :created_at, :updated_at,
              :thumbnail_image, :permalink, :free, :difficulty, :seconds

  has_many :taggings, embed: :ids, include: true
end
