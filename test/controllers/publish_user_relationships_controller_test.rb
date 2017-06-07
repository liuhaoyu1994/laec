require 'test_helper'

class PublishUserRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publish_user_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get publish_user_relationships_destroy_url
    assert_response :success
  end

end
