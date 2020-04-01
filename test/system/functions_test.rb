require "application_system_test_case"

class FunctionsTest < ApplicationSystemTestCase
  setup do
    @function = functions(:one)
  end

  test "visiting the index" do
    visit functions_url
    assert_selector "h1", text: "Functions"
  end

  test "creating a Function" do
    visit functions_url
    click_on "New Function"

    fill_in "Description", with: @function.description
    fill_in "Name", with: @function.name
    fill_in "Notes", with: @function.notes
    click_on "Create Function"

    assert_text "Function was successfully created"
    click_on "Back"
  end

  test "updating a Function" do
    visit functions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @function.description
    fill_in "Name", with: @function.name
    fill_in "Notes", with: @function.notes
    click_on "Update Function"

    assert_text "Function was successfully updated"
    click_on "Back"
  end

  test "destroying a Function" do
    visit functions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Function was successfully destroyed"
  end
end
