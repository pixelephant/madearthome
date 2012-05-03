class PropertiesToProductsController < ApplicationController
  # GET /properties_to_products
  # GET /properties_to_products.json
  def index
    @properties_to_products = PropertiesToProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @properties_to_products }
    end
  end

  # GET /properties_to_products/1
  # GET /properties_to_products/1.json
  def show
    @properties_to_product = PropertiesToProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @properties_to_product }
    end
  end

  # GET /properties_to_products/new
  # GET /properties_to_products/new.json
  def new
    @properties_to_product = PropertiesToProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @properties_to_product }
    end
  end

  # GET /properties_to_products/1/edit
  def edit
    @properties_to_product = PropertiesToProduct.find(params[:id])
  end

  # POST /properties_to_products
  # POST /properties_to_products.json
  def create
    @properties_to_product = PropertiesToProduct.new(params[:properties_to_product])

    respond_to do |format|
      if @properties_to_product.save
        format.html { redirect_to @properties_to_product, notice: 'Properties to product was successfully created.' }
        format.json { render :json => @properties_to_product, status: :created, location: @properties_to_product }
      else
        format.html { render action: "new" }
        format.json { render :json => @properties_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties_to_products/1
  # PUT /properties_to_products/1.json
  def update
    @properties_to_product = PropertiesToProduct.find(params[:id])

    respond_to do |format|
      if @properties_to_product.update_attributes(params[:properties_to_product])
        format.html { redirect_to @properties_to_product, notice: 'Properties to product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render :json => @properties_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties_to_products/1
  # DELETE /properties_to_products/1.json
  def destroy
    @properties_to_product = PropertiesToProduct.find(params[:id])
    @properties_to_product.destroy

    respond_to do |format|
      format.html { redirect_to properties_to_products_url }
      format.json { head :ok }
    end
  end
end
