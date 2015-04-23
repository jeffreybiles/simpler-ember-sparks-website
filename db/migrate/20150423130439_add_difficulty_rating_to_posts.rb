class AddDifficultyRatingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :difficulty, :string
  end
end
