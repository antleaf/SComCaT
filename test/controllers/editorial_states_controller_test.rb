require 'test_helper'

class EditorialStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @editorial_state = editorial_states(:one)
  end

  test "should get index" do
    get editorial_states_url
    assert_response :success
  end

  test "should get new" do
    get new_editorial_state_url
    assert_response :success
  end

  test "should create editorial_state" do
    assert_difference('EditorialState.count') do
      post editorial_states_url, params: { editorial_state: { description: @editorial_state.description, name: @editorial_state.name } }
    end

    assert_redirected_to editorial_state_url(EditorialState.last)
  end

  test "should show editorial_state" do
    get editorial_state_url(@editorial_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_editorial_state_url(@editorial_state)
    assert_response :success
  end

  test "should update editorial_state" do
    patch editorial_state_url(@editorial_state), params: { editorial_state: { description: @editorial_state.description, name: @editorial_state.name } }
    assert_redirected_to editorial_state_url(@editorial_state)
  end

  test "should destroy editorial_state" do
    assert_difference('EditorialState.count', -1) do
      delete editorial_state_url(@editorial_state)
    end

    assert_redirected_to editorial_states_url
  end
end
