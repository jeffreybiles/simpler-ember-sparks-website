class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :video_url, :description, :transcript, 
              :publish_date, :created_at, :updated_at,
              :thumbnail_image, :permalink, :free, :difficulty

  has_many :taggings, embed: :ids, include: true
end