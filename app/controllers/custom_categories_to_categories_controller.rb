class CustomCategoriesToCategoriesController < ApplicationController
  # GET /custom_categories_to_categories
  # GET /custom_categories_to_categories.json
  def index
    @custom_categories_to_categories = CustomCategoriesToCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @custom_categories_to_categories }
    end
  end

  # GET /custom_categories_to_categories/1
  # GET /custom_categories_to_categories/1.json
  def show
    @custom_categories_to_category = CustomCategoriesToCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @custom_categories_to_category }
    end
  end

  # GET /custom_categories_to_categories/new
  # GET /custom_categories_to_categories/new.json
  def new
    @custom_categories_to_category = CustomCategoriesToCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @custom_categories_to_category }
    end
  end

  # GET /custom_categories_to_categories/1/edit
  def edit
    @custom_categories_to_category = CustomCategoriesToCategory.find(params[:id])
  end

  # POST /custom_categories_to_categories
  # POST /custom_categories_to_categories.json
  def create
    @custom_categories_to_category = CustomCategoriesToCategory.new(params[:custom_categories_to_category])

    respond_to do |format|
      if @custom_categories_to_category.save
        format.html { redirect_to @custom_categories_to_category, notice: 'Custom categories to category was successfully created.' }
        format.json { render json: @custom_categories_to_category, status: :created, location: @custom_categories_to_category }
      else
        format.html { render action: "new" }
        format.json { render json: @custom_categories_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /custom_categories_to_categories/1
  # PUT /custom_categories_to_categories/1.json
  def update
    @custom_categories_to_category = CustomCategoriesToCategory.find(params[:id])

    respond_to do |format|
      if @custom_categories_to_category.update_attributes(params[:custom_categories_to_category])
        format.html { redirect_to @custom_categories_to_category, notice: 'Custom categories to category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @custom_categories_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_categories_to_categories/1
  # DELETE /custom_categories_to_categories/1.json
  def destroy
    @custom_categories_to_category = CustomCategoriesToCategory.find(params[:id])
    @custom_categories_to_category.destroy

    respond_to do |format|
      format.html { redirect_to custom_categories_to_categories_url }
      format.json { head :ok }
    end
  end
end
