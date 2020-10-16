require 'test_helper'

class BusinessFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_form = business_forms(:one)
  end

  test "should get index" do
    get business_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_business_form_url
    assert_response :success
  end

  test "should create business_form" do
    assert_difference('BusinessForm.count') do
      post business_forms_url, params: { business_form: { description: @business_form.description, name: @business_form.name, notes: @business_form.notes, slug: @business_form.slug } }
    end

    assert_redirected_to business_form_url(BusinessForm.last)
  end

  test "should show business_form" do
    get business_form_url(@business_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_form_url(@business_form)
    assert_response :success
  end

  test "should update business_form" do
    patch business_form_url(@business_form), params: { business_form: { description: @business_form.description, name: @business_form.name, notes: @business_form.notes, slug: @business_form.slug } }
    assert_redirected_to business_form_url(@business_form)
  end

  test "should destroy business_form" do
    assert_difference('BusinessForm.count', -1) do
      delete business_form_url(@business_form)
    end

    assert_redirected_to business_forms_url
  end
end
