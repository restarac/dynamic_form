class FormAnswer < ActiveRecord::Base
  belongs_to :custom_form
  
  has_many :form_answer_fields, dependent: :destroy
  
  def answer_by field
    form_answer_fields.detect { |f| f.custom_form_field.id == field.id }
  end
  
  def answer_value_by field
    answer = answer_by field
    
    if answer
      answer.value 
    else
      ''
    end
  end
end
