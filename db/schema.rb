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

ActiveRecord::Schema.define(version: 2021_08_18_053850) do

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "foster_id"
    t.string "area"
    t.text "introduction"
    t.string "image_id"
    t.string "dog_breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fosters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "telephone_number"
    t.string "postal_code"
    t.boolean "is_deleted", default: false, null: false
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_fosters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fosters_on_reset_password_token", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "dog_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "postal_code"
    t.text "address"
    t.boolean "is_deleted", default: false, null: false
    t.string "telephone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id"
    t.boolean "is_member"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "member_id"
    t.integer "foster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foster_id"], name: "index_rooms_on_foster_id"
    t.index ["member_id"], name: "index_rooms_on_member_id"
  end

end
