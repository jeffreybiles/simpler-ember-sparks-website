class AddLinksAndThumbnailField < ActiveRecord::Migration
  def change
    add_column :posts, :links, :string
    add_column :posts, :thumbnail_image, :string
  end
end
