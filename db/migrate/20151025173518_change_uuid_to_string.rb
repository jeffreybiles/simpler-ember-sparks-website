class ChangeUuidToString < ActiveRecord::Migration
  def change
    change_column :posts, :guid, :string
  end
end
