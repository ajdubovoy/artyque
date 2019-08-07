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

ActiveRecord::Schema.define(version: 20190807114500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "color_palette", default: 0
    t.integer "shape", default: 1
    t.string "super_title"
    t.string "title"
    t.text "description"
    t.string "button_text"
    t.integer "layout", default: 1
    t.string "video"
    t.string "quotation"
    t.string "quotation_caption"
    t.string "photo"
    t.text "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.bigint "collection_id"
    t.string "name"
    t.text "description"
    t.integer "width"
    t.integer "height"
    t.integer "depth"
    t.integer "year"
    t.string "medium"
    t.integer "price"
    t.integer "weight"
    t.boolean "highlight", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["collection_id"], name: "index_artworks_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["artist_id"], name: "index_collections_on_artist_id"
  end

  create_table "contact_forms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "title"
    t.text "description"
    t.string "url"
    t.integer "year"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_links_on_artist_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "artwork_id"
    t.string "attachment"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_photos_on_artwork_id"
  end

  create_table "resume_blocks", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_resume_blocks_on_artist_id"
  end

  create_table "resume_items", force: :cascade do |t|
    t.bigint "resume_block_id"
    t.string "description"
    t.string "label"
    t.string "year"
    t.boolean "highlight"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_block_id"], name: "index_resume_items_on_resume_block_id"
  end

  create_table "upcoming_projects", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "date"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_upcoming_projects_on_artist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "artwork_id"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_videos_on_artwork_id"
  end

  add_foreign_key "artists", "users"
  add_foreign_key "artworks", "collections"
  add_foreign_key "collections", "artists"
  add_foreign_key "links", "artists"
  add_foreign_key "photos", "artworks"
  add_foreign_key "resume_blocks", "artists"
  add_foreign_key "resume_items", "resume_blocks"
  add_foreign_key "upcoming_projects", "artists"
  add_foreign_key "videos", "artworks"
end
