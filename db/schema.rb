# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 24) do

  create_table "calendars", :force => true do |t|
    t.string   "title"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "class_schedules", :force => true do |t|
    t.string   "age"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "cost"
    t.string   "occurs_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "lft"
    t.string   "rgt"
    t.string   "permalink"
    t.boolean  "active",     :default => true
    t.integer  "position"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_forms", :force => true do |t|
    t.string   "title"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "registration_form"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seminars", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "email"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "aide"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "author"
    t.date     "date"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
