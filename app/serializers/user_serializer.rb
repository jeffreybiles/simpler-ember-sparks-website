class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :organization_permission_level

  has_one :organization
end
