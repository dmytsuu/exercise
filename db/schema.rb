# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_191_016_123_040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'product_articles', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.string 'name'
    t.string 'url'
    t.string 'sku'
    t.integer 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'related_articles', default: [], array: true
    t.index ['product_id'], name: 'index_product_articles_on_product_id'
  end

  create_table 'product_photos', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.string 'url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_id'], name: 'index_product_photos_on_product_id'
  end

  create_table 'product_sizes', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.bigint 'size_id', null: false
    t.string 'sku'
    t.boolean 'available'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_id'], name: 'index_product_sizes_on_product_id'
    t.index ['size_id'], name: 'index_product_sizes_on_size_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'sku'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'sizes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'product_articles', 'products'
  add_foreign_key 'product_photos', 'products'
  add_foreign_key 'product_sizes', 'products'
  add_foreign_key 'product_sizes', 'sizes'
end
