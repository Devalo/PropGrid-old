class AddUserToProperty < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :user, foreign_key: true #settes null: false ved anledning
  end
end
