class CustomFormField < ActiveRecord::Base
  belongs_to :custom_form
  
  validates :title,:custom_form_id,:type, presence: true
  
  def form_name
    custom_form.title
  end
end

class CustomFormTextareaField < CustomFormField

  def html_content name, value_field=""
    "<label for='#{name}'>#{title}:</label><br><textarea id='#{name}' name='#{name}' placeholder='#{value}'>#{value_field}</textarea>".html_safe
  end
end

class CustomFormTextField < CustomFormField
end

class CustomFormCheckboxField < CustomFormField
end

class CustomFormSelectField < CustomFormField
end