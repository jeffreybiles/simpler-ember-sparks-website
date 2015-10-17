class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :subscribed

  has_many :users
end
