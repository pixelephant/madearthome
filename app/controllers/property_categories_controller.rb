class PropertyCategoriesController < ApplicationController
  # GET /property_categories
  # GET /property_categories.json
  def index
    @property_categories = PropertyCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @property_categories }
    end
  end

  # GET /property_categories/1
  # GET /property_categories/1.json
  def show
    @property_category = PropertyCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property_category }
    end
  end

  # GET /property_categories/new
  # GET /property_categories/new.json
  def new
    @property_category = PropertyCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property_category }
    end
  end

  # GET /property_categories/1/edit
  def edit
    @property_category = PropertyCategory.find(params[:id])
  end

  # POST /property_categories
  # POST /property_categories.json
  def create
    @property_category = PropertyCategory.new(params[:property_category])

    respond_to do |format|
      if @property_category.save
        format.html { redirect_to @property_category, notice: 'Property category was successfully created.' }
        format.json { render json: @property_category, status: :created, location: @property_category }
      else
        format.html { render action: "new" }
        format.json { render json: @property_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /property_categories/1
  # PUT /property_categories/1.json
  def update
    @property_category = PropertyCategory.find(params[:id])

    respond_to do |format|
      if @property_category.update_attributes(params[:property_category])
        format.html { redirect_to @property_category, notice: 'Property category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @property_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_categories/1
  # DELETE /property_categories/1.json
  def destroy
    @property_category = PropertyCategory.find(params[:id])
    @property_category.destroy

    respond_to do |format|
      format.html { redirect_to property_categories_url }
      format.json { head :ok }
    end
  end
end
