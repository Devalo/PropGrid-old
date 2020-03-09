class RemoveSocialSecFromTenants < ActiveRecord::Migration[6.0]
  def change
    remove_column :tenants, :social_sec_number
  end
end
