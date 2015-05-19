class AddLengthToPostDatabase < ActiveRecord::Migration
  def change
    add_column :posts, :seconds, :integer
  end
end
