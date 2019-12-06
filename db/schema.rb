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

ActiveRecord::Schema.define(version: 2019_12_06_173824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.boolean "favorite", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "api_id"
    t.string "title"
    t.string "salary"
    t.string "description"
    t.string "functions"
    t.string "benefits"
    t.string "city"
    t.string "country"
    t.string "country_flag_url"
    t.string "seniority"
    t.string "logo_url"
    t.string "url"
    t.string "modality"
    t.string "published_at"
    t.boolean "recommended", default: false
    t.boolean "pinned", default: false
    t.boolean "is_hot", default: false
    t.boolean "remote", default: false
    t.boolean "new", default: true
    t.jsonb "company"
  end

end
