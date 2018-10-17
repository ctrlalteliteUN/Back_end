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

ActiveRecord::Schema.define(version: 2018_10_17_051912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adm_groups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_adm_groups_on_group_id"
    t.index ["user_id"], name: "index_adm_groups_on_user_id"
  end

  create_table "app_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "post_id"
    t.text "ruta", default: "-", null: false
    t.bigint "file_type_id", default: 1, null: false
    t.string "description"
    t.string "titulo"
    t.index ["file_type_id"], name: "index_app_files_on_file_type_id"
    t.index ["post_id"], name: "index_app_files_on_post_id"
    t.index ["user_id"], name: "index_app_files_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "file_types", force: :cascade do |t|
    t.string "tipo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_has_tags", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_has_tags_on_group_id"
    t.index ["tag_id"], name: "index_group_has_tags_on_tag_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_has_tags", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_has_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_has_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.integer "solicitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_posts_on_group_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_records_on_service_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "service_has_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_has_users_on_service_id"
    t.index ["user_id"], name: "index_service_has_users_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "score"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_services_on_post_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_has_groups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_has_groups_on_group_id"
    t.index ["user_id"], name: "index_user_has_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "perimission_level"
    t.string "name"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.string "password"
    t.string "password_confirmation"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adm_groups", "groups"
  add_foreign_key "adm_groups", "users"
  add_foreign_key "app_files", "file_types"
  add_foreign_key "app_files", "posts"
  add_foreign_key "app_files", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "group_has_tags", "groups"
  add_foreign_key "group_has_tags", "tags"
  add_foreign_key "post_has_tags", "posts"
  add_foreign_key "post_has_tags", "tags"
  add_foreign_key "posts", "groups"
  add_foreign_key "posts", "users"
  add_foreign_key "records", "services"
  add_foreign_key "records", "users"
  add_foreign_key "service_has_users", "services"
  add_foreign_key "service_has_users", "users"
  add_foreign_key "services", "posts"
  add_foreign_key "user_has_groups", "groups"
  add_foreign_key "user_has_groups", "users"
end
