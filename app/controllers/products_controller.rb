# frozen_string_literal: true

class ProductsController < ApplicationController
  def create
    ::Products::CreateService.call(params: product_params)
  end

  # TODO: specify filtered params
  def product_params
    params.permit!
  end
end
