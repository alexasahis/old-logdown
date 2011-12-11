class PostsController < ApplicationController\
	
	before_filter :require_user, :only => [:edit, :update ]
	before_filter :find_blog
	
	
	def index
		 @posts = current_user.posts.recent.paginate :page => params[:page], :per_page => 20
	end

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
	
	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
    @post = current_user.posts.find(params[:id])		
	
		if @post.update_attributes(params[:post])
			redirect_to edit_post_path(@post), :notice => "Update Success!"
		else
			render :action => "edit"
		end
	end
	
	def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to(posts_url)
  end
	
	protected
	
	def find_blog
		@blog = current_user.blog
	end
	
end
