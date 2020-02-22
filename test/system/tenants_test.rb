require "application_system_test_case"

class TenantsTest < ApplicationSystemTestCase
  setup do
    @tenant = tenants(:one)
  end

  test "visiting the index" do
    visit tenants_url
    assert_selector "h1", text: "Tenants"
  end

  test "creating a Tenant" do
    visit tenants_url
    click_on "New Tenant"

    fill_in "Email", with: @tenant.email
    fill_in "First name", with: @tenant.first_name
    fill_in "Last name", with: @tenant.last_name
    fill_in "Phone number", with: @tenant.phone_number
    fill_in "Social sec number", with: @tenant.social_sec_number
    click_on "Create Tenant"

    assert_text "Tenant was successfully created"
    click_on "Back"
  end

  test "updating a Tenant" do
    visit tenants_url
    click_on "Edit", match: :first

    fill_in "Email", with: @tenant.email
    fill_in "First name", with: @tenant.first_name
    fill_in "Last name", with: @tenant.last_name
    fill_in "Phone number", with: @tenant.phone_number
    fill_in "Social sec number", with: @tenant.social_sec_number
    click_on "Update Tenant"

    assert_text "Tenant was successfully updated"
    click_on "Back"
  end

  test "destroying a Tenant" do
    visit tenants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tenant was successfully destroyed"
  end
end
