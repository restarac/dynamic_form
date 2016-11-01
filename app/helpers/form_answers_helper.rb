module FormAnswersHelper
  def render_field_html field, value_field=""
    name="answer_#{field.id}"    
    render "/form_answers/fields/#{field.type.underscore}", name: name, field: field, value: value_field
  end
  
  def to_options value
    value.split(',').map {|a| [a,a]}
  end
  
  def to_array value
    value.split(',')
  end
  
  def contains search, value_param
    search.include? value_param
  end
end
