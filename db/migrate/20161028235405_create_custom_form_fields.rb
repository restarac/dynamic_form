class CreateCustomFormFields < ActiveRecord::Migration
  def change
    create_table :custom_form_fields do |t|
      t.references :custom_form, index: true
      t.integer :order
      t.string :title
      t.string :value
      t.string :type

      t.timestamps null: false
    end
    add_foreign_key :custom_form_fields, :custom_forms
  end
end
