class AddStuffToLease < ActiveRecord::Migration[6.0]
  def change
    add_column :leases, :deposit_guarantee, :decimal
    add_column :leases, :deposit_guarantee_issuer, :string
  end
end
