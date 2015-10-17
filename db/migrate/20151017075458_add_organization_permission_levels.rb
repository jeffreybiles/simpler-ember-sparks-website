class AddOrganizationPermissionLevels < ActiveRecord::Migration
  def change
    add_column :users, :organization_admin, :boolean
  end
end
