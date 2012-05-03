class LinksProductsController < ApplicationController
  # GET /links_products
  # GET /links_products.json
  def index
    @links_products = LinksProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @links_products }
    end
  end

  # GET /links_products/1
  # GET /links_products/1.json
  def show
    @links_product = LinksProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @links_product }
    end
  end

  # GET /links_products/new
  # GET /links_products/new.json
  def new
    @links_product = LinksProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @links_product }
    end
  end

  # GET /links_products/1/edit
  def edit
    @links_product = LinksProduct.find(params[:id])
  end

  # POST /links_products
  # POST /links_products.json
  def create
    @links_product = LinksProduct.new(params[:links_product])

    respond_to do |format|
      if @links_product.save
        format.html { redirect_to @links_product, notice: 'Links product was successfully created.' }
        format.json { render :json => @links_product, status: :created, location: @links_product }
      else
        format.html { render action: "new" }
        format.json { render :json => @links_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links_products/1
  # PUT /links_products/1.json
  def update
    @links_product = LinksProduct.find(params[:id])

    respond_to do |format|
      if @links_product.update_attributes(params[:links_product])
        format.html { redirect_to @links_product, notice: 'Links product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render :json => @links_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links_products/1
  # DELETE /links_products/1.json
  def destroy
    @links_product = LinksProduct.find(params[:id])
    @links_product.destroy

    respond_to do |format|
      format.html { redirect_to links_products_url }
      format.json { head :ok }
    end
  end
end
