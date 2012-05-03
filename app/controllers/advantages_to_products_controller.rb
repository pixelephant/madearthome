class AdvantagesToProductsController < ApplicationController
  # GET /advantages_to_products
  # GET /advantages_to_products.json
  def index
    @advantages_to_products = AdvantagesToProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @advantages_to_products }
    end
  end

  # GET /advantages_to_products/1
  # GET /advantages_to_products/1.json
  def show
    @advantages_to_product = AdvantagesToProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advantages_to_product }
    end
  end

  # GET /advantages_to_products/new
  # GET /advantages_to_products/new.json
  def new
    @advantages_to_product = AdvantagesToProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advantages_to_product }
    end
  end

  # GET /advantages_to_products/1/edit
  def edit
    @advantages_to_product = AdvantagesToProduct.find(params[:id])
  end

  # POST /advantages_to_products
  # POST /advantages_to_products.json
  def create
    @advantages_to_product = AdvantagesToProduct.new(params[:advantages_to_product])

    respond_to do |format|
      if @advantages_to_product.save
        format.html { redirect_to @advantages_to_product, :notice => 'Advantages to product was successfully created.' }
        format.json { render json: @advantages_to_product, status: :created, location: @advantages_to_product }
      else
        format.html { render action: "new" }
        format.json { render json: @advantages_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /advantages_to_products/1
  # PUT /advantages_to_products/1.json
  def update
    @advantages_to_product = AdvantagesToProduct.find(params[:id])

    respond_to do |format|
      if @advantages_to_product.update_attributes(params[:advantages_to_product])
        format.html { redirect_to @advantages_to_product, :notice => 'Advantages to product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @advantages_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advantages_to_products/1
  # DELETE /advantages_to_products/1.json
  def destroy
    @advantages_to_product = AdvantagesToProduct.find(params[:id])
    @advantages_to_product.destroy

    respond_to do |format|
      format.html { redirect_to advantages_to_products_url }
      format.json { head :ok }
    end
  end
end
