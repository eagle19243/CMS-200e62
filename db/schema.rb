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

ActiveRecord::Schema.define(version: 20170123235038) do

  create_table "content_blocks", force: true do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.string   "block_type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_blocks", ["parent_type", "parent_id", "block_type"], name: "index_content_blocks_on_parent_type_and_parent_id_and_block_type", using: :btree

  create_table "fact_sheet_column_blocks", force: true do |t|
    t.text     "text"
    t.integer  "content_block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "footnotes"
  end

  create_table "fact_sheets", force: true do |t|
    t.string   "language"
    t.text     "introduction"
    t.string   "pdf"
    t.integer  "position"
    t.boolean  "active",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "translated_language"
  end

  create_table "feature_blocks", force: true do |t|
    t.text     "caption"
    t.integer  "content_block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pin_to_bottom",    default: false
    t.string   "alternate"
  end

  add_index "feature_blocks", ["content_block_id"], name: "index_feature_blocks_on_content_block_id", using: :btree

  create_table "image_blocks", force: true do |t|
    t.string   "title"
    t.text     "caption"
    t.integer  "content_block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "size",             default: "small"
    t.string   "alternate"
  end

  add_index "image_blocks", ["content_block_id"], name: "index_image_blocks_on_content_block_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "attachment"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relationship_name"
    t.text     "caption"
    t.integer  "position"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.string   "alternate"
  end

  add_index "images", ["parent_id", "parent_type"], name: "index_images_on_parent_id_and_parent_type", using: :btree

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "position"
    t.boolean  "active",         default: true
    t.boolean  "editable",       default: true
    t.boolean  "in_primary_nav", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "category"
    t.string   "long"
    t.string   "lat"
    t.boolean  "active",     default: true
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_clippings", force: true do |t|
    t.text     "blurb"
    t.string   "source"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "publication_date"
    t.integer  "position"
    t.boolean  "active",           default: true
    t.string   "url"
  end

  create_table "registrants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "country"
    t.boolean  "is_a_broker",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "referrer"
    t.string   "residence_size"
    t.text     "comments"
  end

  create_table "section_blocks", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.integer  "content_block_id"
    t.boolean  "hidden",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_blocks", ["content_block_id"], name: "index_section_blocks_on_content_block_id", using: :btree

  create_table "slides", force: true do |t|
    t.integer  "slideshow_block_id"
    t.string   "slide_type"
    t.text     "caption"
    t.integer  "position"
    t.text     "video_id"
    t.text     "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slideshow_blocks", force: true do |t|
    t.integer  "content_block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.integer  "position"
    t.boolean  "active",     default: true
  end

  create_table "text_blocks", force: true do |t|
    t.string   "title"
    t.integer  "content_block_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "large",            default: false
  end

  add_index "text_blocks", ["content_block_id"], name: "index_text_blocks_on_content_block_id", using: :btree

  create_table "unit_lines", force: true do |t|
    t.string  "name"
    t.integer "number_of_bedrooms"
    t.decimal "number_of_bathrooms",    precision: 20, scale: 1
    t.decimal "price",                  precision: 20, scale: 2
    t.integer "interior_square_feet"
    t.integer "exterior_square_feet"
    t.string  "floorplan"
    t.integer "interior_square_meters"
    t.integer "exterior_square_meters"
    t.string  "status"
    t.integer "active",                                          default: 1
    t.integer "monthly_taxes",                                   default: 0
    t.integer "monthly_common_charges",                          default: 0
  end

  create_table "units", force: true do |t|
    t.integer  "floor"
    t.string   "letter"
    t.integer  "number_of_bedrooms"
    t.integer  "number_of_bathrooms"
    t.decimal  "price",                  precision: 20, scale: 2
    t.integer  "interior_square_feet"
    t.integer  "exterior_square_feet"
    t.string   "floorplan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interior_square_meters"
    t.integer  "exterior_square_meters"
    t.string   "status"
    t.boolean  "active",                                          default: true
    t.integer  "monthly_taxes",                                   default: 0
    t.integer  "monthly_common_charges",                          default: 0
    t.integer  "unit_line_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
    t.boolean  "is_sysop",        default: false
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_blocks", force: true do |t|
    t.text     "url"
    t.text     "video_id"
    t.string   "title"
    t.text     "caption"
    t.integer  "content_block_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width"
    t.integer  "height"
  end

end
