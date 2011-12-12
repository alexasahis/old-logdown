class PostsController < ApplicationController

  layout 'blog'
  
  before_filter :find_user
  before_filter :find_blog
  before_filter :set_basic_settings
  
  def show
    @post = Post.find(params[:id])
  end
  
  protected
  
  def set_basic_settings
    @root_url = "http://xdite.logdown.dev"
  end
  
  def find_user
    @user = User.find_by_login(request.subdomain)
    unless @user
      redirect_to root_url(:subdomain => false )
      return 
    end
  end
  
    def find_blog
        @site = @user.blog
    end
    
end
