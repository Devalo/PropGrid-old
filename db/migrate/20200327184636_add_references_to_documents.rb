class AddReferencesToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :user, foreign_key: true
    add_reference :documents, :property_unit, foreign_key: true
    remove_column :documents, :url
  end
end
