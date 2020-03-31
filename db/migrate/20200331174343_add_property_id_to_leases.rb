class AddPropertyIdToLeases < ActiveRecord::Migration[6.0]
  def change
    add_column :leases, :property_id, :integer
  end
end
