class AddUserToPropertyUnits < ActiveRecord::Migration[6.0]
  def change
    add_reference :property_units, :user, foreign_key: true
  end
end
