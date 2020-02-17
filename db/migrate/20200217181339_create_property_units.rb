class CreatePropertyUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :property_units do |t|
      t.integer :unit_number
      t.string :tenant
      t.text :description
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
