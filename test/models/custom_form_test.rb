require 'test_helper'

class CustomFormTest < ActiveSupport::TestCase

  test "should not save CustomForm without subcategory and a name" do
    form = CustomForm.new
    assert_not form.save
    
    form.title = "teste form"
    assert_not form.save
    
    form.sub_category_id = 1
    assert form.save
  end
  
  test "should delete form_fields, ansers and answers_fields when delete CustomForm" do
    form = custom_forms(:one)
    assert_difference('FormAnswer.count', -1) do
      form.destroy
    end
  end
end
