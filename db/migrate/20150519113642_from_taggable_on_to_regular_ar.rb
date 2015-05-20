class FromTaggableOnToRegularAr < ActiveRecord::Migration
  def change
    remove_column :taggings, :taggable_id
    remove_column :taggings, :tagger_type
    remove_column :taggings, :tagger_id
    remove_column :taggings, :context
    add_column :taggings, :post_id, :integer
  end
end
