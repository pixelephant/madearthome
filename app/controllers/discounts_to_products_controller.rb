class DiscountsToProductsController < ApplicationController
  # GET /discounts_to_products
  # GET /discounts_to_products.json
  def index
    @discounts_to_products = DiscountsToProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discounts_to_products }
    end
  end

  # GET /discounts_to_products/1
  # GET /discounts_to_products/1.json
  def show
    @discounts_to_product = DiscountsToProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discounts_to_product }
    end
  end

  # GET /discounts_to_products/new
  # GET /discounts_to_products/new.json
  def new
    @discounts_to_product = DiscountsToProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discounts_to_product }
    end
  end

  # GET /discounts_to_products/1/edit
  def edit
    @discounts_to_product = DiscountsToProduct.find(params[:id])
  end

  # POST /discounts_to_products
  # POST /discounts_to_products.json
  def create
    @discounts_to_product = DiscountsToProduct.new(params[:discounts_to_product])

    respond_to do |format|
      if @discounts_to_product.save
        format.html { redirect_to @discounts_to_product, notice: 'Discounts to product was successfully created.' }
        format.json { render json: @discounts_to_product, status: :created, location: @discounts_to_product }
      else
        format.html { render action: "new" }
        format.json { render json: @discounts_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discounts_to_products/1
  # PUT /discounts_to_products/1.json
  def update
    @discounts_to_product = DiscountsToProduct.find(params[:id])

    respond_to do |format|
      if @discounts_to_product.update_attributes(params[:discounts_to_product])
        format.html { redirect_to @discounts_to_product, notice: 'Discounts to product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @discounts_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts_to_products/1
  # DELETE /discounts_to_products/1.json
  def destroy
    @discounts_to_product = DiscountsToProduct.find(params[:id])
    @discounts_to_product.destroy

    respond_to do |format|
      format.html { redirect_to discounts_to_products_url }
      format.json { head :ok }
    end
  end
end
