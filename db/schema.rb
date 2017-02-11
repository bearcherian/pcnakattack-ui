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

ActiveRecord::Schema.define(version: 20170207025153) do

  create_table "instagrams", id: :string, limit: 128, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "type",                       limit: 16,   null: false
    t.string   "link",                       limit: 256,  null: false
    t.string   "caption_text",               limit: 1024
    t.string   "user_id",                    limit: 128,  null: false
    t.string   "user_username",              limit: 128,  null: false
    t.string   "user_full_name",             limit: 128
    t.string   "user_profile_picture",       limit: 256,  null: false
    t.string   "images_thumbnail",           limit: 256
    t.string   "images_standard_resolution", limit: 256
    t.string   "images_low_resolution",      limit: 256
    t.datetime "created_time"
    t.string   "videos_low_bandwidth",       limit: 256
    t.string   "videos_low_resolution",      limit: 256
    t.string   "videos_standard_resolution", limit: 256
  end

  create_table "tweets", id: :bigint, default: nil, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.string   "text",                                     null: false
    t.bigint   "user_id",                                  null: false, unsigned: true
    t.string   "user_name"
    t.string   "user_screen_name"
    t.string   "user_profile_image_url_https"
    t.string   "media_type",                   limit: 48
    t.string   "media_url_https"
    t.string   "link",                         limit: 256
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username",       limit: 64,  null: false
    t.string "instagram_code", limit: 128
    t.string "auth_token",     limit: 256
    t.index ["username"], name: "username", unique: true, using: :btree
  end

  create_table "youtube", id: :string, limit: 16, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "publishedAt"
    t.string   "title",             limit: 256,  null: false
    t.string   "description",       limit: 4096
    t.string   "thumbnail_default", limit: 256
    t.string   "thumbnail_medium",  limit: 256
    t.string   "thumbnail_high",    limit: 256
    t.string   "channel_id",        limit: 128
    t.string   "channelTitle",      limit: 64
    t.string   "authorName",        limit: 512
    t.string   "link",              limit: 128
    t.string   "profile_picture",   limit: 256,  null: false
  end

end
