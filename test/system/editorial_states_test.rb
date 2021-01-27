require "application_system_test_case"

class EditorialStatesTest < ApplicationSystemTestCase
  setup do
    @editorial_state = editorial_states(:one)
  end

  test "visiting the index" do
    visit editorial_states_url
    assert_selector "h1", text: "Editorial States"
  end

  test "creating a Editorial state" do
    visit editorial_states_url
    click_on "New Editorial State"

    fill_in "Description", with: @editorial_state.description
    fill_in "Name", with: @editorial_state.name
    click_on "Create Editorial state"

    assert_text "Editorial state was successfully created"
    click_on "Back"
  end

  test "updating a Editorial state" do
    visit editorial_states_url
    click_on "Edit", match: :first

    fill_in "Description", with: @editorial_state.description
    fill_in "Name", with: @editorial_state.name
    click_on "Update Editorial state"

    assert_text "Editorial state was successfully updated"
    click_on "Back"
  end

  test "destroying a Editorial state" do
    visit editorial_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Editorial state was successfully destroyed"
  end
end
