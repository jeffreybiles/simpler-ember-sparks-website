class SetFreeDefaultToFalse < ActiveRecord::Migration
  def change
    change_column :posts, :free, :boolean, default: false
  end
end
