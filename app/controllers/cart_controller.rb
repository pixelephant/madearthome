class CartController < ApplicationController
  layout "simple"
  def index
		@cart = Cart.find(session[:cart_id])
  end
end
