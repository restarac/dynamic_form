require 'test_helper'

class CustomFormFieldsControllerTest < ActionController::TestCase
  setup do
    @custom_form_field = custom_form_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_form_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_form_field" do
    assert_difference('CustomFormField.count') do
      post :create, custom_form_field: { custom_form_id: @custom_form_field.custom_form_id, order: @custom_form_field.order, title: @custom_form_field.title, type: @custom_form_field.type, value: @custom_form_field.value }
    end

    assert_redirected_to custom_form_field_path(assigns(:custom_form_field))
  end

  test "should show custom_form_field" do
    get :show, id: @custom_form_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_form_field
    assert_response :success
  end

  test "should update custom_form_field" do
    patch :update, id: @custom_form_field, custom_form_field: { custom_form_id: @custom_form_field.custom_form_id, order: @custom_form_field.order, title: @custom_form_field.title, type: @custom_form_field.type, value: @custom_form_field.value }
    assert_redirected_to custom_form_field_path(assigns(:custom_form_field))
  end

  test "should destroy custom_form_field" do
    assert_difference('CustomFormField.count', -1) do
      delete :destroy, id: @custom_form_field
    end

    assert_redirected_to custom_form_fields_path
  end
end
