class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :organization_permission_level, :invitation_status, :organization_id
end
