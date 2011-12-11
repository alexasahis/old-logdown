class PostsController < ApplicationController\
	
	before_filter :require_user, :only => [:edit, :update ]
	before_filter :find_blog

	def new
		@post = Post.new
	end
	
	def create
		@post = current_user.posts.build(params[:post])

		if @post.save
			redirect_to posts_path, :notice => "Create Success!"
		else
			render :action => "new"
		end
	end	
	
	protected
	
	def find_blog
		@blog = current_user.blog
	end
	
end
