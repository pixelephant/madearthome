class ComingsoonController < ApplicationController

  layout "comingsoon"

  def index
		render "index"
  end

  def how
		render "how"
  end
end
