class SitesController < ApplicationController

before_filter :require_user, :only => [:edit, :update ]
  
  def edit
	  @blog = current_user.blog
	end
	
	def update
	
		@blog = current_user.blog
		if @blog.update_attributes(params[:blog])
			redirect_to edit_blog_path(current_user.login), :notice => "Update Success!"
		else
			render :action => "edit"
		end
	end
  


end
