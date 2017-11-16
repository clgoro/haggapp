class PostsController < ApplicationController

	before_action :set_post, only: [:edit, :show, :update, :destroy]

	def index
		@posts = if params[:tag]
      		Post.tagged_with(params[:tag]).order(created_at: :desc)
    		else
      		Post.all.order(created_at: :desc)
    	end
	end

	def new
		@user = User.all
		@post = Post.new
	end

	def create
		# render plain: params[:article].inspect
		# @user = User.new(params[:id])
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Article was successfully created"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	
	def update
		if @post.update(post_params)
			flash[:notice] = "Post was successfully updated"
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Article was successfully deleted"
		redirect_to posts_path
	end
	
	private
	def post_params
		params.require(:post).permit(:title, :description, :name, :published_on, :content, :all_tags, :person_name)
	end

	def require_same_user
		if current_user != @post.user and !curren_user.admin?
			flash[:attention] = "You can only edit or delete your own articles"
			redirect_to root_path
		end
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
