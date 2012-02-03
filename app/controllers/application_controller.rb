class ApplicationController < ActionController::Base
  protect_from_forgery

	private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    admin_path
  end

	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

end
