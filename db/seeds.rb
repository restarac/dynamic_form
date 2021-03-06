#encoding: utf-8

Category.create(name: "Reformas e Reparos", slug: "reformas-e-reparos").tap do |category|
  category.sub_categories.create(name: "Pintor", slug: "pintor")
  category.sub_categories.create(name: "Pedreiro", slug: "pedreiro")
end

Category.create(name: "Aulas", slug: "aulas").tap do |category|
  category.sub_categories.create(name: "Música", slug: "musica")
  category.sub_categories.create(name: "Idiomas", slug: "idiomas")
end

CustomForm.create(title: "feedback form", sub_category_id: 1).tap do |form|
  form.custom_form_fields.create(order: 2, title: "Opiniao", value: "Diga o que acha", type: "CustomFormTextareaField")
  form.custom_form_fields.create(order: 1, title: "Nome", value: "Insira seu nome", type: "CustomFormTextField")
  form.custom_form_fields.create(order: 3, title: "Sexo", value: "[Masculino, Feminino]", type: "CustomFormSelectField")
  form.custom_form_fields.create(order: 4, title: "Escola", value: "[Ensino Medio, Tecnico, Graduação, Posgraduacao]", type: "CustomFormCheckboxField")
end