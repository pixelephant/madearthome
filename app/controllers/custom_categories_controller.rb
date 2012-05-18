class CustomCategoriesController < ApplicationController
  # GET /custom_categories
  # GET /custom_categories.json
  def index
    @custom_categories = CustomCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @custom_categories }
    end
  end

  # GET /custom_categories/1
  # GET /custom_categories/1.json
  def show
    @custom_category = CustomCategory.find(params[:id])
		@category = @custom_category.category

		if params[:sort] == 'by_name'
			sort = 'name'
		elsif params[:sort] == 'by_lowest_price'
			sort = 'price ASC'
		elsif params[:sort] == 'by_highest_price'
			sort = 'price DESC'
		else
			sort = 'updated_at'
		end

		if params[:page] == 'all'
			session[:view_all] = true
			@products = @custom_category.products(sort)
			@kaminari_products = Kaminari.paginate_array(@custom_category.products(sort, params)).page(params[:page]).per(21)
		else
			session[:view_all] = false
			@products = Kaminari.paginate_array(@custom_category.products(sort, params)).page(params[:page]).per(21)
			@kaminari_products = @products
		end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @custom_category }
    end
  end

  # GET /custom_categories/new
  # GET /custom_categories/new.json
  def new
    @custom_category = CustomCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @custom_category }
    end
  end

  # GET /custom_categories/1/edit
  def edit
    @custom_category = CustomCategory.find(params[:id])
  end

  # POST /custom_categories
  # POST /custom_categories.json
  def create
    @custom_category = CustomCategory.new(params[:custom_category])

    respond_to do |format|
      if @custom_category.save
        format.html { redirect_to @custom_category, :notice => 'Custom category was successfully created.' }
        format.json { render :json => @custom_category, :status => :created, :location => @custom_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @custom_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /custom_categories/1
  # PUT /custom_categories/1.json
  def update
    @custom_category = CustomCategory.find(params[:id])

    respond_to do |format|
      if @custom_category.update_attributes(params[:custom_category])
        format.html { redirect_to @custom_category, :notice => 'Custom category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @custom_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_categories/1
  # DELETE /custom_categories/1.json
  def destroy
    @custom_category = CustomCategory.find(params[:id])
    @custom_category.destroy

    respond_to do |format|
      format.html { redirect_to custom_categories_url }
      format.json { head :ok }
    end
  end
end
