class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :video_url
      t.text :description
      t.text :transcript
      t.date :publish_date

      t.timestamps
    end
  end
end
