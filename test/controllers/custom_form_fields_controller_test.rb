require 'test_helper'

class CustomFormFieldsControllerTest < ActionController::TestCase
  setup do
    @custom_form_field = custom_form_fields(:one)
    @form_id = @custom_form_field.custom_form.id
  end

  test "should get new" do
    get :new, custom_form_id: @form_id
    assert_response :success
  end

  test "should create custom_form_field and redirect to new" do
    assert_difference('CustomFormField.count') do
      post :create, custom_form_id: @form_id, custom_form_field: { custom_form_id: @custom_form_field.custom_form_id, order: @custom_form_field.order, title: @custom_form_field.title, type: @custom_form_field.type, value: @custom_form_field.value }
    end

    assert_redirected_to new_custom_form_field_path(@custom_form_field.custom_form)
    assert_equal 'Custom form field was successfully created.', flash[:notice]
  end

  test "should get edit" do
    get :edit, custom_form_id: @form_id, id: @custom_form_field
    assert_response :success
  end

  test "should update custom_form_field" do
    patch :update, custom_form_id: @form_id, id: @custom_form_field, custom_form_select_field: { custom_form_id: @custom_form_field.custom_form_id, order: @custom_form_field.order, title: @custom_form_field.title, type: "CustomFormSelectField", value: @custom_form_field.value }

    assert_redirected_to new_custom_form_field_path(@custom_form_field.custom_form)
    assert_equal 'Custom form field was successfully updated.', flash[:notice]
  end

  test "should destroy custom_form_field and redirect to new" do
    
    assert_difference('CustomFormField.count', -1) do
      delete :destroy, custom_form_id: @form_id, id: @custom_form_field
    end

    assert_redirected_to new_custom_form_field_path(@form_id)
    assert_equal 'Custom form field was successfully destroyed.', flash[:notice]
  end
end
