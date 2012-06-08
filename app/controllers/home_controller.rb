class HomeController < ApplicationController
  
  layout "home"
  
  def index
  	@blogposts = WpBlogPost.limit(2).order('post_date desc').where(:post_status => 'publish')
  end
end
