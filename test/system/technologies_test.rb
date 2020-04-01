require "application_system_test_case"

class TechnologiesTest < ApplicationSystemTestCase
  setup do
    @technology = technologies(:one)
  end

  test "visiting the index" do
    visit technologies_url
    assert_selector "h1", text: "Technologies"
  end

  test "creating a Technology" do
    visit technologies_url
    click_on "New Technology"

    fill_in "Adoption level", with: @technology.adoption_level_id
    fill_in "Description", with: @technology.description
    fill_in "Name", with: @technology.name
    fill_in "Notes", with: @technology.notes
    fill_in "Readiness level", with: @technology.readiness_level_id
    fill_in "Url", with: @technology.url
    click_on "Create Technology"

    assert_text "Technology was successfully created"
    click_on "Back"
  end

  test "updating a Technology" do
    visit technologies_url
    click_on "Edit", match: :first

    fill_in "Adoption level", with: @technology.adoption_level_id
    fill_in "Description", with: @technology.description
    fill_in "Name", with: @technology.name
    fill_in "Notes", with: @technology.notes
    fill_in "Readiness level", with: @technology.readiness_level_id
    fill_in "Url", with: @technology.url
    click_on "Update Technology"

    assert_text "Technology was successfully updated"
    click_on "Back"
  end

  test "destroying a Technology" do
    visit technologies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Technology was successfully destroyed"
  end
end
