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

  test "should create custom_form" do
    assert_difference('CustomForm.count') do
      post :create, custom_form: { sub_category_id: @custom_form.sub_category_id }
    end

    assert_redirected_to custom_form_path(assigns(:custom_form))
  end

  test "should show custom_form" do
    get :show, id: @custom_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_form
    assert_response :success
  end

  test "should update custom_form" do
    patch :update, id: @custom_form, custom_form: { sub_category_id: @custom_form.sub_category_id }
    assert_redirected_to custom_form_path(assigns(:custom_form))
  end

  test "should destroy custom_form" do
    assert_difference('CustomForm.count', -1) do
      delete :destroy, id: @custom_form
    end

    assert_redirected_to custom_forms_path
  end
end
