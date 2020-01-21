class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :property_number
      t.integer :postal_code
      t.string :city
      t.string :property_image
      t.integer :rent
      t.string :tenant

      t.timestamps
    end
  end
end
