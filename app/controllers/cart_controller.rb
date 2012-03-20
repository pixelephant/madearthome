class CartController < ApplicationController
  layout "simple"

  def index
		@cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
    @cart = Cart.new
		if @cart.total == 0
			render "empty"
		else
			render "index"
		end
  end

  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

	def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

end
