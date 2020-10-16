require "application_system_test_case"

class BusinessFormsTest < ApplicationSystemTestCase
  setup do
    @business_form = business_forms(:one)
  end

  test "visiting the index" do
    visit business_forms_url
    assert_selector "h1", text: "Business Forms"
  end

  test "creating a Business form" do
    visit business_forms_url
    click_on "New Business Form"

    fill_in "Description", with: @business_form.description
    fill_in "Name", with: @business_form.name
    fill_in "Notes", with: @business_form.notes
    fill_in "Slug", with: @business_form.slug
    click_on "Create Business form"

    assert_text "Business form was successfully created"
    click_on "Back"
  end

  test "updating a Business form" do
    visit business_forms_url
    click_on "Edit", match: :first

    fill_in "Description", with: @business_form.description
    fill_in "Name", with: @business_form.name
    fill_in "Notes", with: @business_form.notes
    fill_in "Slug", with: @business_form.slug
    click_on "Update Business form"

    assert_text "Business form was successfully updated"
    click_on "Back"
  end

  test "destroying a Business form" do
    visit business_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business form was successfully destroyed"
  end
end
