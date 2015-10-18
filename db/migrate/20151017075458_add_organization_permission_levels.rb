class AddOrganizationPermissionLevels < ActiveRecord::Migration
  def change
    add_column :users, :organization_permission_level, :string
  end
end
