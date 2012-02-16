class SearchController < ApplicationController
	# GET /search
  # GET /search.json
  def index
    @search = Product.search do
  	  fulltext params[:search]
	  end

		if params[:page] == 'all'
			@products = @search.results
			@kaminari_products = Kaminari.paginate_array(@search.results).page(params[:page]).per(21)
		else
			@products = Kaminari.paginate_array(@search.results).page(params[:page]).per(21)
			@kaminari_products = @products
		end

  	@products = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
end
