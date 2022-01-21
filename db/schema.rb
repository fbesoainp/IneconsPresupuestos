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

ActiveRecord::Schema.define(version: 2022_01_12_164006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.integer "index"
    t.bigint "item_id"
    t.bigint "material_id"
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_expenses_on_item_id"
    t.index ["material_id"], name: "index_expenses_on_material_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "isMain"
    t.integer "index"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_items_on_item_id"
    t.index ["project_id"], name: "index_items_on_project_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.float "price"
    t.string "unity"
    t.string "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "date"
    t.float "utilitiesFactor"
    t.float "materialsFactor"
    t.float "workForceFactor"
    t.float "generalExpensesFactor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenses", "items"
  add_foreign_key "expenses", "materials"
  add_foreign_key "items", "items"
  add_foreign_key "items", "projects"
end
