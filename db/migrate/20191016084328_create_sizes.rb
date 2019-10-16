# frozen_string_literal: true

class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
