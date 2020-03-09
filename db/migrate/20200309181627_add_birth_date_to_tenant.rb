class AddBirthDateToTenant < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :birth_date, :date
  end
end
