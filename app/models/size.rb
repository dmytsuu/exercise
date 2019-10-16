# frozen_string_literal: true

class Size < ApplicationRecord
  validates :name, uniqueness: true
  has_many :product_sizes
end
