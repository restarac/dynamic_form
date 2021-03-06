# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161031120308) do

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_form_fields", force: :cascade do |t|
    t.integer  "custom_form_id"
    t.integer  "order"
    t.string   "title"
    t.string   "value"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "custom_form_fields", ["custom_form_id"], name: "index_custom_form_fields_on_custom_form_id"

  create_table "custom_forms", force: :cascade do |t|
    t.integer  "sub_category_id"
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "custom_forms", ["sub_category_id"], name: "index_custom_forms_on_sub_category_id"

  create_table "form_answer_fields", force: :cascade do |t|
    t.integer  "form_answer_id"
    t.integer  "custom_form_field_id"
    t.string   "value"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "form_answer_fields", ["custom_form_field_id"], name: "index_form_answer_fields_on_custom_form_field_id"
  add_index "form_answer_fields", ["form_answer_id"], name: "index_form_answer_fields_on_form_answer_id"

  create_table "form_answers", force: :cascade do |t|
    t.integer  "custom_form_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "form_answers", ["custom_form_id"], name: "index_form_answers_on_custom_form_id"

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.text     "name"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

end
