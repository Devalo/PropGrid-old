class AddRentToPropertyUnits < ActiveRecord::Migration[6.0]
  def change
    add_column :property_units, :rent, :decimal, :precision => 8, :scale => 2
    # precision is the total number of digits
# scale is the number of digits to the right of the decimal point
  end
end
