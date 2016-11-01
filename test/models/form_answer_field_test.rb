require 'test_helper'

class FormAnswerFieldTest < ActiveSupport::TestCase
  test "should not save FormAnswerField without subcategory and a name" do
    form = FormAnswerField.new
    assert_not form.save
    
    form.value = "teste form"
    assert_not form.save
    
    form.form_answer_id = 1
    assert_not form.save
    
    form.custom_form_field_id = 1
    assert form.save
  end
end