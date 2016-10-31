class FormAnswer < ActiveRecord::Base
  belongs_to :custom_form
  
  has_many :form_answer_fields, dependent: :destroy
  
  def answer_by field
    form_answer_fields.detect { |f| f.custom_form_field.id == field.id }
  end
  
  def save_or_update_answer field, value_answer
    answer = answer_by field
    if (answer) #atualizar o valor
      if !answer.update(value: value_answer)
        return answer.errors
      end
    else #nil deve criar...
      form_answer_field = FormAnswerField.new(form_answer_id: id, custom_form_field: field, value: value_answer)
      if !form_answer_field.save
        return form_answer_field.errors
      end
    end
  end
  
  def answer_value_by field
    answer = answer_by field
    if answer then answer.value else '' end
  end
end
