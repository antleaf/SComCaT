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

ActiveRecord::Schema.define(version: 2021_01_27_095217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adoption_levels", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.index ["slug"], name: "index_adoption_levels_on_slug", unique: true
  end

  create_table "assignments", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "audits", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "auditable_id"
    t.string "auditable_type", limit: 255
    t.bigint "associated_id"
    t.string "associated_type", limit: 255
    t.bigint "user_id"
    t.string "user_type", limit: 255
    t.string "username", limit: 255
    t.string "action", limit: 255
    t.text "audited_changes"
    t.bigint "version", default: 0
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

  create_table "business_forms", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "slug", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "editorial"
  end

  create_table "categories", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categories_technologies", id: false, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id", "technology_id"], name: "index_cat_tech_2", unique: true
    t.index ["technology_id", "category_id"], name: "index_cat_tech_1", unique: true
  end

  create_table "collections", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "slug"
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.text "editorial"
    t.index ["slug"], name: "index_collections_on_slug", unique: true
  end

  create_table "collections_technologies", id: false, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "collection_id", null: false
    t.index ["collection_id", "technology_id"], name: "index_coll_tech_2", unique: true
    t.index ["technology_id", "collection_id"], name: "index_coll_tech_1", unique: true
  end

  create_table "dependencies", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "dependee_id", null: false
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.index ["dependee_id"], name: "index_dependencies_on_dependee_id"
    t.index ["technology_id", "dependee_id"], name: "index_dependencies_on_technology_id_and_dependee_id", unique: true
    t.index ["technology_id"], name: "index_dependencies_on_technology_id"
  end

  create_table "editorial_states", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "functions", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.index ["slug"], name: "index_functions_on_slug", unique: true
  end

  create_table "functions_technologies", id: false, force: :cascade do |t|
    t.bigint "technology_id", null: false
    t.bigint "function_id", null: false
    t.index ["function_id", "technology_id"], name: "index_func_tech_2", unique: true
    t.index ["technology_id", "function_id"], name: "index_func_tech_1", unique: true
  end

  create_table "governances", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "slug", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "editorial"
    t.index ["slug"], name: "index_governances_on_slug", unique: true
  end

  create_table "readiness_levels", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.index ["slug"], name: "index_readiness_levels_on_slug", unique: true
  end

  create_table "relationships", id: :bigint, default: nil, force: :cascade do |t|
    t.string "predicate", limit: 255
    t.bigint "subj_id", null: false
    t.bigint "obj_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["obj_id"], name: "index_relationships_on_obj_id"
    t.index ["subj_id"], name: "index_relationships_on_subj_id"
  end

  create_table "roles", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "statuses", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "slug", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "editorial"
  end

  create_table "taggings", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type", limit: 255
    t.bigint "taggable_id"
    t.string "tagger_type", limit: 255
    t.bigint "tagger_id"
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

  create_table "tags", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "technologies", id: :bigint, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "url", limit: 255
    t.bigint "adoption_level_id", null: false
    t.bigint "readiness_level_id", null: false
    t.bigint "governance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.text "editorial"
    t.string "roadmap", limit: 255
    t.string "codebase", limit: 255
    t.string "hosting", limit: 255
    t.string "pricing", limit: 255
    t.string "licensing", limit: 255
    t.bigint "business_form_id"
    t.bigint "status_id"
    t.bigint "editorial_state_id"
    t.index ["adoption_level_id"], name: "index_technologies_on_adoption_level_id"
    t.index ["business_form_id"], name: "index_technologies_on_business_form_id"
    t.index ["editorial_state_id"], name: "index_technologies_on_editorial_state_id"
    t.index ["governance_id"], name: "index_technologies_on_governance_id"
    t.index ["readiness_level_id"], name: "index_technologies_on_readiness_level_id"
    t.index ["slug"], name: "index_technologies_on_slug", unique: true
    t.index ["status_id"], name: "index_technologies_on_status_id"
  end

  create_table "users", id: :bigint, default: nil, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "forenames"
    t.text "lastname"
    t.text "editorial"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "roles", name: "assignments_role_id_fkey"
  add_foreign_key "assignments", "users", name: "assignments_user_id_fkey"
  add_foreign_key "dependencies", "technologies", column: "dependee_id", name: "dependencies_dependee_id_fkey"
  add_foreign_key "dependencies", "technologies", name: "dependencies_technology_id_fkey"
  add_foreign_key "relationships", "technologies", column: "obj_id", name: "relationships_obj_id_fkey"
  add_foreign_key "relationships", "technologies", column: "subj_id", name: "relationships_subj_id_fkey"
  add_foreign_key "taggings", "tags", name: "taggings_tag_id_fkey"
  add_foreign_key "technologies", "adoption_levels", name: "technologies_adoption_level_id_fkey"
  add_foreign_key "technologies", "business_forms", name: "technologies_business_form_id_fkey"
  add_foreign_key "technologies", "editorial_states"
  add_foreign_key "technologies", "governances", name: "technologies_governance_id_fkey"
  add_foreign_key "technologies", "readiness_levels", name: "technologies_readiness_level_id_fkey"
  add_foreign_key "technologies", "statuses", name: "technologies_status_id_fkey"
end
