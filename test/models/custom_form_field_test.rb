require 'test_helper'

class CustomFormFieldTest < ActiveSupport::TestCase
  test "should not save field without type" do
    field = CustomFormField.new
    field.title = "teste"
    field.custom_form_id = 1
    assert_not field.save
  end
  
  test "should not save field without title" do
    field = CustomFormField.new
    field.type = CustomFormTextField.class.name
    field.custom_form_id = 1
    assert_not field.save
  end
  
  test "should not save field without formId" do
    field = CustomFormField.new
    field.title = "teste"
    field.type = CustomFormTextField.class.name
    assert_not field.save
  end
end
