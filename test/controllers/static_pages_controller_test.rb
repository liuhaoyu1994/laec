require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get research" do
    get static_pages_research_url
    assert_response :success
  end

  test "should get service" do
    get static_pages_service_url
    assert_response :success
  end

  test "should get aboutus" do
    get static_pages_aboutus_url
    assert_response :success
  end

end
