class BrandController < ApplicationController
  def index
    render "index"
  end

  def lazboy
  	render "lazboy"
  end

  def uttermost
  	render "uttermost"
  end

end