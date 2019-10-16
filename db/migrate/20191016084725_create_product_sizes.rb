# frozen_string_literal: true

class CreateProductSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sizes do |t|
      t.references :product, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.string :sku
      t.boolean :available

      t.timestamps
    end
  end
end
