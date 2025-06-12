module CurrentCart
  extend ActiveSupport::Concern
  

  private

  def current_cart
    if user_signed_in?
      @current_cart ||= current_user.cart || current_user.create_cart
    else
      @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
      @current_cart ||= Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end
