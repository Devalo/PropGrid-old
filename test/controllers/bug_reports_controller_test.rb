require 'test_helper'

class BugReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug_report = bug_reports(:one)
  end

  test "should get index" do
    get bug_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_bug_report_url
    assert_response :success
  end

  test "should create bug_report" do
    assert_difference('BugReport.count') do
      post bug_reports_url, params: { bug_report: { tenant_id: @bug_report.tenant_id, ticket_answered_by: @bug_report.ticket_answered_by, ticket_body: @bug_report.ticket_body, ticket_name: @bug_report.ticket_name, ticket_number: @bug_report.ticket_number, ticket_type: @bug_report.ticket_type, user_id: @bug_report.user_id } }
    end

    assert_redirected_to bug_report_url(BugReport.last)
  end

  test "should show bug_report" do
    get bug_report_url(@bug_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_bug_report_url(@bug_report)
    assert_response :success
  end

  test "should update bug_report" do
    patch bug_report_url(@bug_report), params: { bug_report: { tenant_id: @bug_report.tenant_id, ticket_answered_by: @bug_report.ticket_answered_by, ticket_body: @bug_report.ticket_body, ticket_name: @bug_report.ticket_name, ticket_number: @bug_report.ticket_number, ticket_type: @bug_report.ticket_type, user_id: @bug_report.user_id } }
    assert_redirected_to bug_report_url(@bug_report)
  end

  test "should destroy bug_report" do
    assert_difference('BugReport.count', -1) do
      delete bug_report_url(@bug_report)
    end

    assert_redirected_to bug_reports_url
  end
end