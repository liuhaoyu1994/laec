require 'test_helper'

class PartnerRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get partner_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get partner_relations_destroy_url
    assert_response :success
  end

end
