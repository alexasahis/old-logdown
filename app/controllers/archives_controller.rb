class ArchivesController < ApplicationController
  layout "blog"
	
  before_filter :find_user
  before_filter :set_basic_settings

	def index
		@site = @user.blog
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
