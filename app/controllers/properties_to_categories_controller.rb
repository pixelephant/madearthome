class PropertiesToCategoriesController < ApplicationController
  # GET /properties_to_categories
  # GET /properties_to_categories.json
  def index
    @properties_to_categories = PropertiesToCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @properties_to_categories }
    end
  end

  # GET /properties_to_categories/1
  # GET /properties_to_categories/1.json
  def show
    @properties_to_category = PropertiesToCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @properties_to_category }
    end
  end

  # GET /properties_to_categories/new
  # GET /properties_to_categories/new.json
  def new
    @properties_to_category = PropertiesToCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @properties_to_category }
    end
  end

  # GET /properties_to_categories/1/edit
  def edit
    @properties_to_category = PropertiesToCategory.find(params[:id])
  end

  # POST /properties_to_categories
  # POST /properties_to_categories.json
  def create
    @properties_to_category = PropertiesToCategory.new(params[:properties_to_category])

    respond_to do |format|
      if @properties_to_category.save
        format.html { redirect_to @properties_to_category, notice: 'Properties to category was successfully created.' }
        format.json { render :json => @properties_to_category, status: :created, location: @properties_to_category }
      else
        format.html { render action: "new" }
        format.json { render :json => @properties_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties_to_categories/1
  # PUT /properties_to_categories/1.json
  def update
    @properties_to_category = PropertiesToCategory.find(params[:id])

    respond_to do |format|
      if @properties_to_category.update_attributes(params[:properties_to_category])
        format.html { redirect_to @properties_to_category, notice: 'Properties to category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render :json => @properties_to_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties_to_categories/1
  # DELETE /properties_to_categories/1.json
  def destroy
    @properties_to_category = PropertiesToCategory.find(params[:id])
    @properties_to_category.destroy

    respond_to do |format|
      format.html { redirect_to properties_to_categories_url }
      format.json { head :ok }
    end
  end
end
