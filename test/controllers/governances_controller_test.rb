require 'test_helper'

class GovernancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @governance = governances(:one)
  end

  test "should get index" do
    get governances_url
    assert_response :success
  end

  test "should get new" do
    get new_governance_url
    assert_response :success
  end

  test "should create governance" do
    assert_difference('Governance.count') do
      post governances_url, params: { governance: { description: @governance.description, name: @governance.name, notes: @governance.notes, slug: @governance.slug } }
    end

    assert_redirected_to governance_url(Governance.last)
  end

  test "should show governance" do
    get governance_url(@governance)
    assert_response :success
  end

  test "should get edit" do
    get edit_governance_url(@governance)
    assert_response :success
  end

  test "should update governance" do
    patch governance_url(@governance), params: { governance: { description: @governance.description, name: @governance.name, notes: @governance.notes, slug: @governance.slug } }
    assert_redirected_to governance_url(@governance)
  end

  test "should destroy governance" do
    assert_difference('Governance.count', -1) do
      delete governance_url(@governance)
    end

    assert_redirected_to governances_url
  end
end
