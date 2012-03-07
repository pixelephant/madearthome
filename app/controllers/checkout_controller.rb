class CheckoutController < ApplicationController
  layout "simple"

  def index
		@cart = Cart.find(session[:cart_id])
		render 'register-login'
  end
  
  def billing_shipping
    render 'billing-shipping'
  end

  def payment
    render 'payment'
  end
  
  def thankyou
    render 'thankyou'
  end

end
