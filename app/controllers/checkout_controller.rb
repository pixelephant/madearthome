class CheckoutController < ApplicationController
  layout "simple"

  def index
		@cart = Cart.find(session[:cart_id])
		render 'register-login'
  end
  
  def billing_shipping
    render 'billing-shipping'
  end

end
