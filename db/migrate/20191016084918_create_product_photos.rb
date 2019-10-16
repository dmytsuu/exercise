# frozen_string_literal: true

class CreateProductPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :product_photos do |t|
      t.references :product, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
