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

ActiveRecord::Schema.define(version: 20170904062706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "layout"
    t.string   "name"
    t.string   "names"
    t.string   "mana_cost"
    t.integer  "cmc"
    t.string   "colors"
    t.string   "color_identity"
    t.string   "type_line"
    t.string   "supertypes"
    t.string   "types"
    t.string   "subtypes"
    t.string   "rarity"
    t.text     "text"
    t.text     "flavor"
    t.string   "artist"
    t.string   "number"
    t.string   "power"
    t.string   "toughness"
    t.string   "loyalty"
    t.integer  "multiverseid"
    t.string   "variations"
    t.string   "image_name"
    t.string   "watermark"
    t.string   "border"
    t.integer  "timeshifted"
    t.integer  "hand"
    t.integer  "life"
    t.boolean  "reserved"
    t.date     "release_date"
    t.boolean  "starter"
    t.integer  "mci_number"
    t.text     "rulings"
    t.text     "foreign_names"
    t.string   "printings"
    t.text     "original_text"
    t.string   "original_type"
    t.string   "legalities"
    t.string   "source"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
