class CartsController < ApplicationController
  before_action :set_product, only: [:add_item, :remove_item]

  def show
    @cart_items = current_cart.cart_items.includes(:product)
  end

  def add_item
    @cart_item = current_cart.cart_items.find_or_initialize_by(product: @product)
    @cart_item.quantity += 1
    @cart_item.save
    flash[:notice] = "Added to your cart"
    redirect_to cart_path
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end

