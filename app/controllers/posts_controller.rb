class PostsController < ApplicationController
  def index
       if params[:tag]
            @posts = Post.tagged_with(params[:tag])
       else
            @posts = Post.all
       end
  end

  def create
       @post = Post.new(post_params)
       respond_to do |format|
            if @post.save
                 format.js
            else
                 format.html { render root_path }
            end
       end
  end

  private

  def post_params
       params.require(:post).permit(:title, :description, :all_tags)
  end
end
