class AddHasPermalinkToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :permalink, :string
    add_index :tags, :permalink
  end
  def self.down
    remove_column :tags, :permalink
  end
end
