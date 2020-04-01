class CreateBugReports < ActiveRecord::Migration[6.0]
  def change
    create_table :bug_reports do |t|
      t.string :ticket_name
      t.integer :ticket_type
      t.integer :ticket_number
      t.text :ticket_body
      t.references :tenant, foreign_key: true
      t.integer :ticket_answered_by
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
