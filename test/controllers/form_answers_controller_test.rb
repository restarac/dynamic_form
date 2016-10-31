require 'test_helper'

class FormAnswersControllerTest < ActionController::TestCase
  setup do
    @form_answer = form_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_answer" do
    assert_difference('FormAnswer.count') do
      post :create, form_answer: { custom_form_id: @form_answer.custom_form_id }
    end

    assert_redirected_to form_answer_path(assigns(:form_answer))
  end

  test "should show form_answer" do
    get :show, id: @form_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_answer
    assert_response :success
  end

  test "should update form_answer" do
    patch :update, id: @form_answer, form_answer: { custom_form_id: @form_answer.custom_form_id }
    assert_redirected_to form_answer_path(assigns(:form_answer))
  end

  test "should destroy form_answer" do
    assert_difference('FormAnswer.count', -1) do
      delete :destroy, id: @form_answer
    end

    assert_redirected_to form_answers_path
  end
end
