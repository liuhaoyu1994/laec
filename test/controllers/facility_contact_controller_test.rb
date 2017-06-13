require 'test_helper'

class FacilityContactControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get facility_contact_create_url
    assert_response :success
  end

  test "should get destroy" do
    get facility_contact_destroy_url
    assert_response :success
  end

end
