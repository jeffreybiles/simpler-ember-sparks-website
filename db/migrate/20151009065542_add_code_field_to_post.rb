class AddCodeFieldToPost < ActiveRecord::Migration
  def change
    add_column :posts, :code, :text
  end
end
