require 'test_helper'

class FormAnswerTest < ActiveSupport::TestCase

  setup do
    @answers = form_answers(:one)
    @answer_field = form_answer_fields(:one)
    @form_field = custom_form_fields(:one)
    @form_field_empty = custom_form_fields(:three)
  end

  test "should not save field without custom_form" do
    field = FormAnswer.new
    assert_not field.save
    
    field.custom_form_id = 1
    assert field.save
  end

  test "should return answer for the question" do
    answer = @answers.answer_by(@form_field)
    assert_equal @answer_field, answer, "A resposta retornada e a esperada são diferentes"
  end
  
  test "should return nil if not found answer for the question" do
    answer = @answers.answer_by(@form_field_empty)
    assert_nil answer, "Deveria ser nil"
  end
  
  test "should return answer values for the question" do
    answer = @answers.answer_value_by(@form_field)
    assert_equal @answer_field.value, answer, "A resposta retornada e a esperada são diferentes"
  end
  
  test "should return empty string if not found answer for the question" do
    answer = @answers.answer_value_by(@form_field_empty)
    assert_empty answer, "Deveria ser vazio('')"
  end
  
  test "should list all the question in a custom form besides exist answer or not" do
    answers = @answers.list_form_fields
    assert_equal 3, answers.size, "Deve listar todos os campos independente se existe resposta ou nao."
  end

  test "should update when answer already exists" do
    value_expected = "Novo valor"
    errors = @answers.save_or_update_answer @form_field, value_expected
    @answer_field.reload
    
    assert_equal value_expected, @answer_field.value, "O valor do campo de resposta deveria estar com o novo valor"
    assert_nil errors, "Não deve retornar errors caso salve com sucesso"
  end
  
  test "should return errors if occours when updating" do
    value_expected = nil
    errors = @answers.save_or_update_answer @form_field, value_expected
    @answer_field.reload
    
    assert_not_empty errors, "Deve retornar os erros do ActiveRecord"
  end
  
  test "should create when answer is new for that question" do
    answer = @answers.answer_value_by(@form_field_empty)
    assert_empty answer, "Deve estar vazio para o teste iniciar"

    value_expected = "Novo valor"    
    errors = @answers.save_or_update_answer @form_field_empty, value_expected
    assert_nil errors, "Não deve retornar errors caso salve com sucesso"

    @answers.reload
    answer = @answers.answer_value_by(@form_field_empty)
    assert_equal value_expected, answer, "O valor do campo de resposta deveria estar com o novo valor"
  end
  
  test "should return errors if occours when creating" do
    answer = @answers.answer_value_by(@form_field_empty)
    assert_empty answer, "Deve estar vazio para o teste iniciar"

    value_expected = nil
    errors = @answers.save_or_update_answer @form_field_empty, value_expected
    assert_not_empty errors, "Deve retornar os erros do ActiveRecord"
  end
end
