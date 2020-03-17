require "application_system_test_case"

class AdoptionLevelsTest < ApplicationSystemTestCase
  setup do
    @adoption_level = adoption_levels(:one)
  end

  test "visiting the index" do
    visit adoption_levels_url
    assert_selector "h1", text: "Adoption Levels"
  end

  test "creating a Adoption level" do
    visit adoption_levels_url
    click_on "New Adoption Level"

    fill_in "Description", with: @adoption_level.description
    fill_in "Name", with: @adoption_level.name
    fill_in "Notes", with: @adoption_level.notes
    click_on "Create Adoption level"

    assert_text "Adoption level was successfully created"
    click_on "Back"
  end

  test "updating a Adoption level" do
    visit adoption_levels_url
    click_on "Edit", match: :first

    fill_in "Description", with: @adoption_level.description
    fill_in "Name", with: @adoption_level.name
    fill_in "Notes", with: @adoption_level.notes
    click_on "Update Adoption level"

    assert_text "Adoption level was successfully updated"
    click_on "Back"
  end

  test "destroying a Adoption level" do
    visit adoption_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adoption level was successfully destroyed"
  end
end
