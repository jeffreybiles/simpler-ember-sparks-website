class EnterpriseAdminRelationship < ActiveRecord::Migration
  def change
    create_table :organization do |t|
      t.string :name
      t.string :stripe_customer_id
      t.boolean :subscribed
      
      t.timestamps
    end
    add_column :users, :organization_id, :integer
  end
end
