# frozen_string_literal: true

class ProductArticlesController < ApplicationController
  def update
    ::ProductArticles::UpdateService.call(params: product_article_params)
  end

  # TODO: specify filtered params
  def product_article_params
    params.permit!
  end
end
