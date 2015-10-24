class AddGuidToPost < ActiveRecord::Migration
  def change
    add_column :posts, :guid, :uuid
  end
end
