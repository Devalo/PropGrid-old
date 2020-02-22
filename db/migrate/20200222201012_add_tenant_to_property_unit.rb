class AddTenantToPropertyUnit < ActiveRecord::Migration[6.0]
  def change
    add_reference :property_units, :tenant, foreign_key: true
  end
end
