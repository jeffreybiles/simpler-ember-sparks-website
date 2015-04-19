class SeriesAndSubjects < ActiveRecord::Migration
  def change
    add_column :tags, :description, :text
    add_column :tags, :tag_type, :string
    add_column :tags, :priority, :decimal
  end
end
