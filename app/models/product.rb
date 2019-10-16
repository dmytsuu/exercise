# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :product_article, dependent: :destroy
  has_many :product_sizes, dependent: :destroy
  has_many :product_photos, dependent: :destroy
  accepts_nested_attributes_for :product_article, :product_photos, :product_sizes
end
