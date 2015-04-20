class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tag_type, :priority
end