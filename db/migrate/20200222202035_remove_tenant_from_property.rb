class RemoveTenantFromProperty < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :tenant
  end
end
