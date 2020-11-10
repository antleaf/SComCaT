# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_10_111308) do

  create_table "adoption_levels", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.index ["slug"], name: "index_adoption_levels_on_slug", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type", limit: 255
    t.integer "associated_id"
    t.string "associated_type", limit: 255
    t.integer "user_id"
    t.string "user_type", limit: 255
    t.string "username", limit: 255
    t.string "action", limit: 255
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment", limit: 255
    t.string "remote_address", limit: 255
    t.string "request_uuid", limit: 255
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "business_forms", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.string "slug", limit: 255
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categories_technologies", id: false, force: :cascade do |t|
    t.integer "technology_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id", "technology_id"], name: "index_cat_tech_2", unique: true
    t.index ["technology_id", "category_id"], name: "index_cat_tech_1", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "notes"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_collections_on_slug", unique: true
  end

  create_table "collections_technologies", id: false, force: :cascade do |t|
    t.integer "technology_id", null: false
    t.integer "collection_id", null: false
    t.index ["collection_id", "technology_id"], name: "index_coll_tech_2", unique: true
    t.index ["technology_id", "collection_id"], name: "index_coll_tech_1", unique: true
  end

  create_table "functions", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.index ["slug"], name: "index_functions_on_slug", unique: true
  end

  create_table "functions_technologies", id: false, force: :cascade do |t|
    t.integer "technology_id", null: false
    t.integer "function_id", null: false
    t.index ["function_id", "technology_id"], name: "index_func_tech_2", unique: true
    t.index ["technology_id", "function_id"], name: "index_func_tech_1", unique: true
  end

  create_table "governances", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.text "notes"
    t.string "slug", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_governances_on_slug", unique: true
  end

  create_table "readiness_levels", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.index ["slug"], name: "index_readiness_levels_on_slug", unique: true
  end

  create_table "relationships", force: :cascade do |t|
    t.string "predicate", limit: 255
    t.integer "subj_id", null: false
    t.integer "obj_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["obj_id"], name: "index_relationships_on_obj_id"
    t.index ["subj_id"], name: "index_relationships_on_subj_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.string "slug", limit: 255
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type", limit: 255
    t.integer "taggable_id"
    t.string "tagger_type", limit: 255
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description", limit: 255
    t.string "url", limit: 255
    t.text "notes"
    t.integer "adoption_level_id", null: false
    t.integer "readiness_level_id", null: false
    t.integer "governance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.string "roadmap", limit: 255
    t.string "codebase", limit: 255
    t.string "hosting", limit: 255
    t.string "pricing", limit: 255
    t.string "licensing", limit: 255
    t.integer "business_form_id"
    t.integer "status_id"
    t.index ["adoption_level_id"], name: "index_technologies_on_adoption_level_id"
    t.index ["business_form_id"], name: "index_technologies_on_business_form_id"
    t.index ["governance_id"], name: "index_technologies_on_governance_id"
    t.index ["readiness_level_id"], name: "index_technologies_on_readiness_level_id"
    t.index ["slug"], name: "index_technologies_on_slug", unique: true
    t.index ["status_id"], name: "index_technologies_on_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "forenames"
    t.string "lastname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "relationships", "technologies", column: "obj_id"
  add_foreign_key "relationships", "technologies", column: "subj_id"
  add_foreign_key "taggings", "tags"
  add_foreign_key "technologies", "adoption_levels"
  add_foreign_key "technologies", "business_forms"
  add_foreign_key "technologies", "governances"
  add_foreign_key "technologies", "readiness_levels"
  add_foreign_key "technologies", "statuses"
end
