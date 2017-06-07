require 'test_helper'

class PublishRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publish_relationships_new_url
    assert_response :success
  end

  test "should get show" do
    get publish_relationships_show_url
    assert_response :success
  end

  test "should get index" do
    get publish_relationships_index_url
    assert_response :success
  end

  test "should get edit" do
    get publish_relationships_edit_url
    assert_response :success
  end

end
