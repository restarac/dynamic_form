class CustomForm < ActiveRecord::Base
  belongs_to :sub_category

  has_many :custom_form_fields, dependent: :destroy
  has_many :form_answers, dependent: :destroy
  
  validates :sub_category_id, :title, presence: true
end
