class PostsController < ApplicationController

  layout 'blog'
  
	before_filter :find_user
  before_filter :find_blog
  
  def show
  end
  
  protected
  
  
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
