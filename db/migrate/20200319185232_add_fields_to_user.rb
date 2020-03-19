class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :org_number, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
  end
end
