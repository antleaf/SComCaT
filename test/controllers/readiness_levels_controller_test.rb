require 'test_helper'

class ReadinessLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @readiness_level = readiness_levels(:one)
  end

  test "should get index" do
    get readiness_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_readiness_level_url
    assert_response :success
  end

  test "should create readiness_level" do
    assert_difference('ReadinessLevel.count') do
      post readiness_levels_url, params: { readiness_level: { description: @readiness_level.description, name: @readiness_level.name, notes: @readiness_level.notes } }
    end

    assert_redirected_to readiness_level_url(ReadinessLevel.last)
  end

  test "should show readiness_level" do
    get readiness_level_url(@readiness_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_readiness_level_url(@readiness_level)
    assert_response :success
  end

  test "should update readiness_level" do
    patch readiness_level_url(@readiness_level), params: { readiness_level: { description: @readiness_level.description, name: @readiness_level.name, notes: @readiness_level.notes } }
    assert_redirected_to readiness_level_url(@readiness_level)
  end

  test "should destroy readiness_level" do
    assert_difference('ReadinessLevel.count', -1) do
      delete readiness_level_url(@readiness_level)
    end

    assert_redirected_to readiness_levels_url
  end
end
