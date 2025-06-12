class CartsController < ApplicationController
  before_action :set_product, only: [:add_item, :remove_item]

  def show
    @cart_items = current_cart.cart_items.includes(:product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end

