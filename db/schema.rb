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

ActiveRecord::Schema.define(version: 20140910224100) do

  create_table "avatars", force: true do |t|
    t.string   "employee_num"
    t.string   "company_name"
    t.string   "employee_name"
    t.string   "avatar_type"
    t.float    "strength"
    t.float    "constitution"
    t.float    "intelligence"
    t.float    "magic"
    t.float    "agility"
    t.float    "charm"
    t.float    "luck"
    t.float    "potential"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "dates"
  end

  create_table "badge_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badge_conditions", force: true do |t|
    t.integer  "badge_id"
    t.string   "condition"
    t.integer  "pass_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badge_logs", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.integer  "badge_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "badge_type"
    t.integer  "upload_file_id"
    t.integer  "badge_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.string   "instruction_code"
    t.string   "status_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_management_sheets", force: true do |t|
    t.integer  "year",            limit: 4, null: false
    t.integer  "month",           limit: 2, null: false
    t.string   "employee_num",              null: false
    t.string   "company_name",              null: false
    t.string   "department_code",           null: false
    t.string   "instruction_id",            null: false
    t.string   "team_code",                 null: false
    t.string   "work_task_id",              null: false
    t.string   "work_process_id",           null: false
    t.float    "man_hour",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "avatar_id"
    t.text     "task_code"
  end

  create_table "upload_files", force: true do |t|
    t.string   "filename"
    t.string   "content_type"
    t.string   "disk_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "disk_fullpath"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin",                  default: 0
    t.text     "name",                   default: ""
    t.text     "employee_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "work_processes", force: true do |t|
    t.string   "process_code"
    t.string   "status_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_tasks", force: true do |t|
    t.string   "short_task_code"
    t.string   "status_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
