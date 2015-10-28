class AddTestimonialTable < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :link
      t.string :testifier
      t.string :credentials
      t.string :quote
      t.integer :weight, max: 100

      t.timestamps
    end
  end
end
