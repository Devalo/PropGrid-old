class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :adress
      t.string :number
      t.integer :postalcode
      t.string :city
      t.string :image
      t.integer :rent
      t.string :tenant

      t.timestamps
    end
  end
end
