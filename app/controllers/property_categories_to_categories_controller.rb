class PropertyCategoriesToCategoriesController < ApplicationController
  # GET /property_categories_to_categories
  # GET /property_categories_to_categories.json
  def index
    @property_categories_to_categories = PropertyCategoriesToCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @property_categories_to_categories }
    end
  end

  # GET /property_categories_to_categories/1
  # GET /property_categories_to_categories/1.json
  def show
    @property_categories_to_category = PropertyCategoriesToCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property_categories_to_category }
    end
  end

  # GET /property_categories_to_categories/new
  # GET /property_categories_to_categories/new.json
  def new
    @property_categories_to_category = PropertyCategoriesToCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property_categories_to_category }
    end
  end

  # GET /property_categories_to_categories/1/edit
  def edit
    @property_categories_to_category = PropertyCategoriesToCategory.find(params[:id])
  end

  # POST /property_categories_to_categories
  # POST /property_categories_to_categories.json
  def create
    @property_categories_to_category = PropertyCategoriesToCategory.new(params[:property_categories_to_category])

    respond_to do |format|
      if @property_categories_to_category.save
        format.html { redirect_to @property_categories_to_category, notice: 'Property categories to category was successfully created.' }
        format.json { render json: @property_categories_to_category, status: :created, location: @property_categories_to_category }
      else
        format.html { render action: "new" }
        format.json { render json: @property_categories_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /property_categories_to_categories/1
  # PUT /property_categories_to_categories/1.json
  def update
    @property_categories_to_category = PropertyCategoriesToCategory.find(params[:id])

    respond_to do |format|
      if @property_categories_to_category.update_attributes(params[:property_categories_to_category])
        format.html { redirect_to @property_categories_to_category, notice: 'Property categories to category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @property_categories_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_categories_to_categories/1
  # DELETE /property_categories_to_categories/1.json
  def destroy
    @property_categories_to_category = PropertyCategoriesToCategory.find(params[:id])
    @property_categories_to_category.destroy

    respond_to do |format|
      format.html { redirect_to property_categories_to_categories_url }
      format.json { head :ok }
    end
  end
end
