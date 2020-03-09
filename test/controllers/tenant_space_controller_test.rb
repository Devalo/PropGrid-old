require 'test_helper'

class TenantSpaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant_space_index_url
    assert_response :success
  end

end
