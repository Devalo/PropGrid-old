class AddFieldsToLease < ActiveRecord::Migration[6.0]
  def change
    add_column :leases, :landlord_name, :string
    add_column :leases, :landlord_email, :string
    add_column :leases, :landlord_phone, :string
    add_column :leases, :tenant_name, :string
    add_column :leases, :tenant_email, :string
    add_column :leases, :tenant_phone, :string
  end
end
