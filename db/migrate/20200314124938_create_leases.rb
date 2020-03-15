class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property_unit, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true
      t.boolean :power_included
      t.boolean :water_wastewater
      t.boolean :cable_tv
      t.boolean :internet
      t.decimal :deposit
      t.string :deposit_account
      t.boolean :animals
      t.string :animal_specify
      t.boolean :smoking
      t.string :rules_of_conduct_other
      t.boolean :rent_as_is
      t.text :other_description
      t.date :due_date
      t.string :rent_account
      t.boolean :rent_indefinite
      t.date :rent_start_date
      t.date :rent_stop_date

      t.timestamps
    end
  end
end
