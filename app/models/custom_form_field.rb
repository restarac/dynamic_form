class CustomFormField < ActiveRecord::Base
  belongs_to :custom_form
  
  validates :title,:custom_form_id,:type, presence: true
  
  def form_name
    custom_form.title
  end
end

class CustomFormTextareaField < CustomFormField

  def html_content name
    "<label for='#{name}'>#{title}</label> <textarea id='#{name}' name='#{name}' value='#{value}'><textarea>".html_safe
  end
end

class CustomFormTextField < CustomFormField
end

class CustomFormCheckboxField < CustomFormField
end

class CustomFormSelectField < CustomFormField
end