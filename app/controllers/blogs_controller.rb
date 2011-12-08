class BlogsController < ApplicationController
  layout 'blog'
  
  before_filter :find_user
  
  def show
    @blog = @user.blog
    if current_user && current_user == @user
      @posts = @blog.posts.recent.paginate(:page => params[:page], :per_page => 20 )
    else
      @posts = @blog.posts.published.paginate(:page => params[:page], :per_page => 20 )
    end
    respond_to do |format|
      format.html
      format.css
      format.rss
    end
  end
  
  def find_user
    @user = User.find_by_login(request.subdomain)
    unless @user
      redirect_to root_url(:subdomain => false )
      return 
    end
  end
  
end
