class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :organization_admin

  has_one :organization
end
