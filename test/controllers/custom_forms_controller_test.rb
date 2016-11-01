require 'test_helper'

class CustomFormsControllerTest < ActionController::TestCase
  setup do
    @custom_form = custom_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_form and redirect to new_custom_form_fields" do
    assert_difference('CustomForm.count') do
      post :create, custom_form: { sub_category_id: @custom_form.sub_category_id, title: @custom_form.title }
    end

    assert_redirected_to new_custom_form_field_path(assigns(:custom_form))
    assert_equal 'Custom form was successfully created.', flash[:notice]
  end

  test "should stay on edit to show errors" do
    post :create, custom_form: { sub_category_id: @custom_form.sub_category_id }
    assert_response :success
    assert_select "div:match('id', ?)",/error_explanation/
  end

  test "should get edit" do
    get :edit, id: @custom_form
    assert_response :success
  end

  test "should update custom_form and stay editing" do
    patch :update, id: @custom_form, custom_form: { sub_category_id: @custom_form.sub_category_id, title: @custom_form.title }
    assert_response :success
    assert_equal 'Custom form was successfully updated.', flash[:notice]
  end

  test "should destroy custom_form" do
    assert_difference('CustomForm.count', -1) do
      delete :destroy, id: @custom_form
    end

    assert_redirected_to custom_forms_path
    assert_equal 'Custom form was successfully destroyed.', flash[:notice]
  end
end
