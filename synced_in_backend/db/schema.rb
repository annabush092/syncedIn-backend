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

ActiveRecord::Schema.define(version: 20171122125301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.integer "family_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "user_instrument_id"
    t.integer "genre_id"
    t.boolean "perform"
    t.boolean "teach"
  end

  create_table "user_contacts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "contact_id"
  end

  create_table "user_instruments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "instrument_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "username"
    t.string "last_name"
  end

end
