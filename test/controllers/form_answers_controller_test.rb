require 'test_helper'

class FormAnswersControllerTest < ActionController::TestCase
  setup do
    @form_answer = form_answers(:one)
    @form_answer_field = form_answer_fields(:one)
    @form_field3 = custom_form_fields(:three)
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

  test "should create form_answer and redirect to answer fields" do
    assert_difference('FormAnswer.count') do
      post :create, form_answer: { custom_form_id: @form_answer.custom_form_id }
    end

    assert_redirected_to new_answer_form_answer_path(assigns(:form_answer))
    assert_equal 'Now you can answer the folowing questions.', flash[:notice]
  end

  test "should get new answer fields" do
    get :new_answer, id: @form_answer.id
    assert_response :success
  end

  test "should save_answers form_answer and show" do
    skip("TODO: Verificar fluxo de cadastro")
    assert_difference('FormAnswerField.count') do
      post :save_answer, id: @form_answer.custom_form_id, "answer_#{@form_field3.id}".to_sym() => { value: "casa" }
    end

    assert_redirected_to form_answer_path(@form_answer)
    assert_equal 'Now you can answer the folowing questions.', flash[:notice]
  end

  test "should show form_answer" do
    get :show, id: @form_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_answer
    assert_response :success
  end

  test "should update all the answers" do
    skip("TODO: Verificar fluxo de cadastro, nao está atualizando as respostas")
    patch :update, id: @form_answer, form_answer: { custom_form_id: @form_answer.custom_form_id }
    
    assert_redirected_to form_answer_path(@form_answer)
    assert_equal 'Form answer was successfully updated.', flash[:notice]
  end

  test "should destroy form_answer" do
    assert_difference('FormAnswer.count', -1) do
      delete :destroy, id: @form_answer
    end

    assert_redirected_to form_answers_path
  end
end
