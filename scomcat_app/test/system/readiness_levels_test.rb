require "application_system_test_case"

class ReadinessLevelsTest < ApplicationSystemTestCase
  setup do
    @readiness_level = readiness_levels(:one)
  end

  test "visiting the index" do
    visit readiness_levels_url
    assert_selector "h1", text: "Readiness Levels"
  end

  test "creating a Readiness level" do
    visit readiness_levels_url
    click_on "New Readiness Level"

    fill_in "Description", with: @readiness_level.description
    fill_in "Name", with: @readiness_level.name
    fill_in "Notes", with: @readiness_level.notes
    click_on "Create Readiness level"

    assert_text "Readiness level was successfully created"
    click_on "Back"
  end

  test "updating a Readiness level" do
    visit readiness_levels_url
    click_on "Edit", match: :first

    fill_in "Description", with: @readiness_level.description
    fill_in "Name", with: @readiness_level.name
    fill_in "Notes", with: @readiness_level.notes
    click_on "Update Readiness level"

    assert_text "Readiness level was successfully updated"
    click_on "Back"
  end

  test "destroying a Readiness level" do
    visit readiness_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Readiness level was successfully destroyed"
  end
end
