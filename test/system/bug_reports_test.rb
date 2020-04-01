require "application_system_test_case"

class BugReportsTest < ApplicationSystemTestCase
  setup do
    @bug_report = bug_reports(:one)
  end

  test "visiting the index" do
    visit bug_reports_url
    assert_selector "h1", text: "Bug Reports"
  end

  test "creating a Bug report" do
    visit bug_reports_url
    click_on "New Bug Report"

    fill_in "Tenant", with: @bug_report.tenant_id
    fill_in "Ticket answered by", with: @bug_report.ticket_answered_by
    fill_in "Ticket body", with: @bug_report.ticket_body
    fill_in "Ticket name", with: @bug_report.ticket_name
    fill_in "Ticket number", with: @bug_report.ticket_number
    fill_in "Ticket type", with: @bug_report.ticket_type
    fill_in "User", with: @bug_report.user_id
    click_on "Create Bug report"

    assert_text "Bug report was successfully created"
    click_on "Back"
  end

  test "updating a Bug report" do
    visit bug_reports_url
    click_on "Edit", match: :first

    fill_in "Tenant", with: @bug_report.tenant_id
    fill_in "Ticket answered by", with: @bug_report.ticket_answered_by
    fill_in "Ticket body", with: @bug_report.ticket_body
    fill_in "Ticket name", with: @bug_report.ticket_name
    fill_in "Ticket number", with: @bug_report.ticket_number
    fill_in "Ticket type", with: @bug_report.ticket_type
    fill_in "User", with: @bug_report.user_id
    click_on "Update Bug report"

    assert_text "Bug report was successfully updated"
    click_on "Back"
  end

  test "destroying a Bug report" do
    visit bug_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bug report was successfully destroyed"
  end
end
