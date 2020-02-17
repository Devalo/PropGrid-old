require 'test_helper'

class PropertyUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_unit = property_units(:one)
  end

  test "should get index" do
    get property_units_url
    assert_response :success
  end

  test "should get new" do
    get new_property_unit_url
    assert_response :success
  end

  test "should create property_unit" do
    assert_difference('PropertyUnit.count') do
      post property_units_url, params: { property_unit: { description: @property_unit.description, property_id: @property_unit.property_id, tenant: @property_unit.tenant, unit_number: @property_unit.unit_number } }
    end

    assert_redirected_to property_unit_url(PropertyUnit.last)
  end

  test "should show property_unit" do
    get property_unit_url(@property_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_unit_url(@property_unit)
    assert_response :success
  end

  test "should update property_unit" do
    patch property_unit_url(@property_unit), params: { property_unit: { description: @property_unit.description, property_id: @property_unit.property_id, tenant: @property_unit.tenant, unit_number: @property_unit.unit_number } }
    assert_redirected_to property_unit_url(@property_unit)
  end

  test "should destroy property_unit" do
    assert_difference('PropertyUnit.count', -1) do
      delete property_unit_url(@property_unit)
    end

    assert_redirected_to property_units_url
  end
end
