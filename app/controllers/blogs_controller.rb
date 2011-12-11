class BlogsController < ApplicationController

  layout "blog", :except => [:edit, :update]
	layout "application", :only => [:edit, :update]
	
  before_filter :find_user, :except => [:edit, :update]
  before_filter :require_user, :only => [:edit, :update ]

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
  
  def edit
	  @blog = current_user.blog
	end
	
	def update
	
		@blog = current_user.blog
		if @blog.update_attributes(params[:blog])
			redirect_to edit_blog_path(current_user.login), :notice => "update blog success"
		else
			render :action => "edit"
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
