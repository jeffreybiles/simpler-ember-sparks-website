class MostRecentPublishDateToDate < ActiveRecord::Migration
  def change
    change_column :tags, :most_recent_publish_date, :date
  end
end
