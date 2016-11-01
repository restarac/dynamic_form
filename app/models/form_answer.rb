class FormAnswer < ActiveRecord::Base
  belongs_to :custom_form
  
  has_many :form_answer_fields, dependent: :destroy
  
  def answer_by field
    form_answer_fields.detect { |f| f.custom_form_field.id == field.id }
  end
  
  def list_form_fields
    custom_form.custom_form_fields.order(:order, :title)
  end
  
  def save_or_update_answer field, value_answer
    answer = answer_by field
    if (answer) #Atualizar o valor
      answer.value = value_answer
    else #(nil) Deve criar um novo...
      answer = FormAnswerField.new(form_answer_id: id, custom_form_field: field, value: value_answer)
    end
    
    if !answer.save then answer.errors else nil end
  end
  
  def answer_value_by field
    answer = answer_by field
    if answer then answer.value else '' end
  end
end