class AddPictureToSeries < ActiveRecord::Migration
  def change
    add_column :tags, :thumbnail_image, :string
  end
end
