# frozen_string_literal: true

class AddRelatedArticlesToProductArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :product_articles, :related_articles, :integer, default: [], array: true
  end
end
