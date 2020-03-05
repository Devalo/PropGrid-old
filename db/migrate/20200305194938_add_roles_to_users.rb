class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :landlord_role, :boolean, default: true
    add_column :users, :tenant_role, :boolean, default: false
  end
end
