# frozen_string_literal: true

class ProductArticles::UpdateService < ApplicationService
  def call
    product_article.related_articles.push(*related_article_ids)
    product_article.save
  end

  private

  def product_article
    @product_article ||= ProductArticle.find_by(sku: params[:article_sku])
  end

  def related_article_ids
    ProductArticle.where(sku: params[:related_sku]).ids
  end
end
