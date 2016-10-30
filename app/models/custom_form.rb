class CustomForm < ActiveRecord::Base
  belongs_to :sub_category

  has_many :custom_form_fields, dependent: :destroy
end
