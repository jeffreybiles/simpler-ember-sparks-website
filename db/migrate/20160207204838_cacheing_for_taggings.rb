class CacheingForTaggings < ActiveRecord::Migration
  def change
    add_column :tags, :most_recent_publish_date, :datetime
    add_column :tags, :taggings_count, :integer
  end
end
