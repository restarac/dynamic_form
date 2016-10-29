class CreateCustomForms < ActiveRecord::Migration
  def change
    create_table :custom_forms do |t|
      t.references :sub_category, index: true

      t.timestamps null: false
    end
    add_foreign_key :custom_forms, :sub_categories
  end
end
