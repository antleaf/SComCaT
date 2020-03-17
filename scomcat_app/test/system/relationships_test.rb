require "application_system_test_case"

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    @relationship = relationships(:one)
  end

  test "visiting the index" do
    visit relationships_url
    assert_selector "h1", text: "Relationships"
  end

  test "creating a Relationship" do
    visit relationships_url
    click_on "New Relationship"

    fill_in "Obj", with: @relationship.obj_id
    fill_in "Predicate", with: @relationship.predicate
    fill_in "Subj", with: @relationship.subj_id
    click_on "Create Relationship"

    assert_text "Relationship was successfully created"
    click_on "Back"
  end

  test "updating a Relationship" do
    visit relationships_url
    click_on "Edit", match: :first

    fill_in "Obj", with: @relationship.obj_id
    fill_in "Predicate", with: @relationship.predicate
    fill_in "Subj", with: @relationship.subj_id
    click_on "Update Relationship"

    assert_text "Relationship was successfully updated"
    click_on "Back"
  end

  test "destroying a Relationship" do
    visit relationships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relationship was successfully destroyed"
  end
end
