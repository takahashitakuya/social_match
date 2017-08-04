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

ActiveRecord::Schema.define(version: 20170804015604) do

  create_table "profile_terms", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "display_name"
    t.text "description"
    t.text "policy"
    t.string "catch_copy"
    t.text "content"
    t.string "staff_lastname"
    t.string "staff_firstname"
    t.string "tel"
    t.string "fax"
    t.string "website"
    t.string "postal_code"
    t.string "address_pref"
    t.string "address_city"
    t.string "address_number"
    t.string "address_building"
    t.string "address_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_name"
    t.string "profile_image_file_name"
    t.string "profile_image_content_type"
    t.integer "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string "cover_image_file_name"
    t.string "cover_image_content_type"
    t.integer "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.boolean "publish"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "relations", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "target_profile_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "term_rerationships", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_term_rerationships_on_profile_id"
    t.index ["term_id"], name: "index_term_rerationships_on_term_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "name"
    t.string "taxonomy"
    t.string "slug"
    t.string "description"
    t.integer "count"
    t.string "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
