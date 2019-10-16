# frozen_string_literal: true

class Products::CreateService < ApplicationService
  def call
    Product.create(product_attributes)
  end

  private

  def product_attributes
    { name: params[:product_name], sku: params[:product_sku],
      product_article_attributes: product_article_attributes,
      product_sizes_attributes: product_sizes_attributes,
      product_photos_attributes: params[:photos] }
  end

  def product_article_attributes
    { name: params[:article_name], sku: params[:article_sku], url: params[:url], price: params[:price] }
  end

  def product_sizes_attributes
    params[:sizes].map do |size|
      { sku: size[:size_sku], available: size[:available], size: Size.find_or_create_by(name: size[:name]) }
    end
  end
end
