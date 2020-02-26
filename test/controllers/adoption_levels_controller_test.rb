require 'test_helper'

class AdoptionLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adoption_level = adoption_levels(:one)
  end

  test "should get index" do
    get adoption_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_adoption_level_url
    assert_response :success
  end

  test "should create adoption_level" do
    assert_difference('AdoptionLevel.count') do
      post adoption_levels_url, params: { adoption_level: { description: @adoption_level.description, name: @adoption_level.name, notes: @adoption_level.notes } }
    end

    assert_redirected_to adoption_level_url(AdoptionLevel.last)
  end

  test "should show adoption_level" do
    get adoption_level_url(@adoption_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_adoption_level_url(@adoption_level)
    assert_response :success
  end

  test "should update adoption_level" do
    patch adoption_level_url(@adoption_level), params: { adoption_level: { description: @adoption_level.description, name: @adoption_level.name, notes: @adoption_level.notes } }
    assert_redirected_to adoption_level_url(@adoption_level)
  end

  test "should destroy adoption_level" do
    assert_difference('AdoptionLevel.count', -1) do
      delete adoption_level_url(@adoption_level)
    end

    assert_redirected_to adoption_levels_url
  end
end
