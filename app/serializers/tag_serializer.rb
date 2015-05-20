class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tag_type, :priority

  has_many :taggings, embed: :ids, include: true
end