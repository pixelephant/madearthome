class AdminController < ApplicationController
  layout "admin"
  def index
		@products = Product.all
		@users = User.all
  end
end
