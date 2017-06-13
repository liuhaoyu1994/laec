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

ActiveRecord::Schema.define(version: 20170613170316) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "facility_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["facility_id"], name: "index_appointments_on_facility_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.text     "contact"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "facility_contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "facility_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["facility_id"], name: "index_facility_contacts_on_facility_id"
    t.index ["user_id"], name: "index_facility_contacts_on_user_id"
  end

  create_table "facility_services", force: :cascade do |t|
    t.integer  "facility_id"
    t.integer  "service_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["facility_id"], name: "index_facility_services_on_facility_id"
    t.index ["service_id"], name: "index_facility_services_on_service_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_galleries_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.text     "publication"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.text     "descryption"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "time"
  end

  create_table "publish_relationships", force: :cascade do |t|
    t.integer  "publication_id"
    t.integer  "project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["project_id"], name: "index_publish_relationships_on_project_id"
    t.index ["publication_id"], name: "index_publish_relationships_on_publication_id"
  end

  create_table "publish_user_relationships", force: :cascade do |t|
    t.integer  "publication_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publication_id", "user_id"], name: "index_publish_user_relationships_on_publication_id_and_user_id", unique: true
    t.index ["publication_id"], name: "index_publish_user_relationships_on_publication_id"
    t.index ["user_id"], name: "index_publish_user_relationships_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id", "author_id"], name: "index_relationships_on_article_id_and_author_id", unique: true
    t.index ["article_id"], name: "index_relationships_on_article_id"
    t.index ["author_id"], name: "index_relationships_on_author_id"
  end

  create_table "services", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.string   "title"
    t.integer  "department"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "tel"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
