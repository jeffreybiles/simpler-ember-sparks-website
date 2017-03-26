class AddYoutubeUrl < ActiveRecord::Migration
  def change
    add_column :posts, :youtube_url, :string
  end
end
