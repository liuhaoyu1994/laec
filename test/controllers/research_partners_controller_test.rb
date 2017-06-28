require 'test_helper'

class ResearchPartnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research_partner = research_partners(:one)
  end

  test "should get index" do
    get research_partners_url
    assert_response :success
  end

  test "should get new" do
    get new_research_partner_url
    assert_response :success
  end

  test "should create research_partner" do
    assert_difference('ResearchPartner.count') do
      post research_partners_url, params: { research_partner: { description: @research_partner.description, image: @research_partner.image, title: @research_partner.title } }
    end

    assert_redirected_to research_partner_url(ResearchPartner.last)
  end

  test "should show research_partner" do
    get research_partner_url(@research_partner)
    assert_response :success
  end

  test "should get edit" do
    get edit_research_partner_url(@research_partner)
    assert_response :success
  end

  test "should update research_partner" do
    patch research_partner_url(@research_partner), params: { research_partner: { description: @research_partner.description, image: @research_partner.image, title: @research_partner.title } }
    assert_redirected_to research_partner_url(@research_partner)
  end

  test "should destroy research_partner" do
    assert_difference('ResearchPartner.count', -1) do
      delete research_partner_url(@research_partner)
    end

    assert_redirected_to research_partners_url
  end
end
