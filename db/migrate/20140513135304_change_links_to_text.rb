class ChangeLinksToText < ActiveRecord::Migration
  def change
    change_column :posts, :links, :text
  end
end
