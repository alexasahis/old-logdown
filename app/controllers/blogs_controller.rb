class BlogsController < ApplicationController

  layout "blog"
	
  before_filter :find_user, :except => [:edit, :update]


  before_filter :set_basic_settings, :except => [:edit, :update]

  

  
  def show
    @site = @user.blog
    @posts = @site.posts
    respond_to do |format|
      format.html
      format.css
      format.rss
    end
  end
  

  
  def set_basic_settings
    @root_url = ""
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
