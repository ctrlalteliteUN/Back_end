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

ActiveRecord::Schema.define(version: 2018_09_29_193845) do

  create_table "adm_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_adm_groups_on_group_id"
    t.index ["user_id"], name: "index_adm_groups_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "file", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text "path", null: false
    t.integer "file_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_type_id"], name: "index_file_on_file_type_id"
    t.index ["post_id"], name: "index_file_on_post_id"
    t.index ["user_id"], name: "index_file_on_user_id"
  end

  create_table "file_types", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_has_tags", force: :cascade do |t|
    t.integer "group_id"
    t.integer "tag_id"
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
    t.integer "post_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_has_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_has_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "body"
    t.integer "solicitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer "user_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_records_on_service_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "service_has_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_has_users_on_service_id"
    t.index ["user_id"], name: "index_service_has_users_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "score"
    t.integer "post_id"
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
    t.integer "user_id"
    t.integer "group_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
