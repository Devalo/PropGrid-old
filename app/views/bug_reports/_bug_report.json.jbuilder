json.extract! bug_report, :id, :ticket_name, :ticket_type, :ticket_number, :ticket_body, :tenant_id, :ticket_answered_by, :user_id, :created_at, :updated_at
json.url bug_report_url(bug_report, format: :json)
