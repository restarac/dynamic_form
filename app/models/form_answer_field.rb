class FormAnswerField < ActiveRecord::Base
  belongs_to :form_answer
  belongs_to :custom_form_field
  
  validates :value, :form_answer_id, :custom_form_field_id, presence: true
end