class CustomFormField < ActiveRecord::Base
  belongs_to :custom_form
  
  def form_name
    custom_form.title
  end
end

class CustomFormTextareaField < CustomFormField
end

class CustomFormTextField < CustomFormField
end

class CustomFormCheckboxField < CustomFormField
end

class CustomFormSelectField < CustomFormField
end