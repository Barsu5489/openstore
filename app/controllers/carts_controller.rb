class CartsController < ApplicationController
  before_action :set_product, only: [:add_item, :remove_item]

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end

