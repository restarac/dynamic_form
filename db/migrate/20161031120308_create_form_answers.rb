class CreateFormAnswers < ActiveRecord::Migration
  def change
    create_table :form_answers do |t|
      t.references :custom_form, index: true

      t.timestamps null: false
    end
    add_foreign_key :form_answers, :custom_forms
    
    create_table :form_answer_fields do |t|
      t.references :form_answers, index: true
      t.string :value 

      t.timestamps null: false
    end
    add_foreign_key :form_answer_fields, :form_answers
  end
end
