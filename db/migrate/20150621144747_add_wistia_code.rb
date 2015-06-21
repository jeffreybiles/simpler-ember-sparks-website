class AddWistiaCode < ActiveRecord::Migration
  def change
    add_column :posts, :wistia_embed, :text
  end
end
