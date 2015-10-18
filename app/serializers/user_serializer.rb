class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :organization_permission_level, :organization_id
end
