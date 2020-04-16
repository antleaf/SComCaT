require "application_system_test_case"

class GovernancesTest < ApplicationSystemTestCase
  setup do
    @governance = governances(:one)
  end

  test "visiting the index" do
    visit governances_url
    assert_selector "h1", text: "Governances"
  end

  test "creating a Governance" do
    visit governances_url
    click_on "New Governance"

    fill_in "Description", with: @governance.description
    fill_in "Name", with: @governance.name
    fill_in "Notes", with: @governance.notes
    fill_in "Slug", with: @governance.slug
    click_on "Create Governance"

    assert_text "Governance was successfully created"
    click_on "Back"
  end

  test "updating a Governance" do
    visit governances_url
    click_on "Edit", match: :first

    fill_in "Description", with: @governance.description
    fill_in "Name", with: @governance.name
    fill_in "Notes", with: @governance.notes
    fill_in "Slug", with: @governance.slug
    click_on "Update Governance"

    assert_text "Governance was successfully updated"
    click_on "Back"
  end

  test "destroying a Governance" do
    visit governances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Governance was successfully destroyed"
  end
end
