class AddMultipleToPropertyUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :property_units, :property_type, :integer
    add_column :property_units, :kitchen, :boolean
    add_column :property_units, :bathroom, :boolean
    add_column :property_units, :number_of_rooms, :integer
    add_column :property_units, :storage_spaces, :integer
    add_column :property_units, :parking_lots, :integer
  end
end
