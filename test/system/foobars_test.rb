require "application_system_test_case"

class FoobarsTest < ApplicationSystemTestCase
  setup do
    @foobar = foobars(:one)
  end

  test "visiting the index" do
    visit foobars_url
    assert_selector "h1", text: "Foobars"
  end

  test "creating a Foobar" do
    visit foobars_url
    click_on "New Foobar"

    fill_in "Name", with: @foobar.name
    fill_in "Number", with: @foobar.number
    click_on "Create Foobar"

    assert_text "Foobar was successfully created"
    click_on "Back"
  end

  test "updating a Foobar" do
    visit foobars_url
    click_on "Edit", match: :first

    fill_in "Name", with: @foobar.name
    fill_in "Number", with: @foobar.number
    click_on "Update Foobar"

    assert_text "Foobar was successfully updated"
    click_on "Back"
  end

  test "destroying a Foobar" do
    visit foobars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Foobar was successfully destroyed"
  end
end
