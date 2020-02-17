require "application_system_test_case"

class PropertyUnitsTest < ApplicationSystemTestCase
  setup do
    @property_unit = property_units(:one)
  end

  test "visiting the index" do
    visit property_units_url
    assert_selector "h1", text: "Property Units"
  end

  test "creating a Property unit" do
    visit property_units_url
    click_on "New Property Unit"

    fill_in "Description", with: @property_unit.description
    fill_in "Property", with: @property_unit.property_id
    fill_in "Tenant", with: @property_unit.tenant
    fill_in "Unit number", with: @property_unit.unit_number
    click_on "Create Property unit"

    assert_text "Property unit was successfully created"
    click_on "Back"
  end

  test "updating a Property unit" do
    visit property_units_url
    click_on "Edit", match: :first

    fill_in "Description", with: @property_unit.description
    fill_in "Property", with: @property_unit.property_id
    fill_in "Tenant", with: @property_unit.tenant
    fill_in "Unit number", with: @property_unit.unit_number
    click_on "Update Property unit"

    assert_text "Property unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Property unit" do
    visit property_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property unit was successfully destroyed"
  end
end
