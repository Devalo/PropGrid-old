class AddFieldsToBugReport < ActiveRecord::Migration[6.0]
  def change
    add_column :bug_reports, :ticket_urgency, :integer
    add_column :bug_reports, :ticket_browser, :string
  end
end
