class BlogsController < ApplicationController

  layout "blog"
	
  before_filter :find_user
  before_filter :set_basic_settings
  
  def show
    @site = @user.blog
    @posts = @site.posts.published
    respond_to do |format|
      format.html
      format.css
      format.rss
    end
  end
  

  
  def set_basic_settings
    @root_url = "http://xdite.logdown.dev"
  end
  
  protected
  
  
  def find_user
    @user = User.find_by_login(request.subdomain)
    unless @user
      redirect_to root_url(:subdomain => false )
      return 
    end
  end
  
end
