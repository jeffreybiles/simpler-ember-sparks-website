class AddDefaultPlaybackSpeed < ActiveRecord::Migration
  def change
    add_column :users, :default_playback_speed, :decimal, precision: 4, scale: 2, default: 1
  end
end
