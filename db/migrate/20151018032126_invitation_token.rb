class InvitationToken < ActiveRecord::Migration
  def change
    add_column :users, :invitation_token, :string
    add_column :users, :invitation_status, :string
  end
end
