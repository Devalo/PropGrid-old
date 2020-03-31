class AddMoreFieldsToLease < ActiveRecord::Migration[6.0]
  def change
    add_column :leases, :rent_amount, :decimal, :precision => 8, :scale => 2
    add_column :leases, :property_type_int, :integer
    add_column :leases, :property_type, :string
    add_column :leases, :unit_number, :integer
    add_column :leases, :property_address, :string
    add_column :leases, :property_postal_code, :integer
    add_column :leases, :property_city, :string
    add_column :leases, :kitchen, :boolean
    add_column :leases, :bathroom, :boolean
    add_column :leases, :number_of_rooms, :integer
    add_column :leases, :storage_spaces, :integer
    add_column :leases, :parking_lots, :integer
  end
end
