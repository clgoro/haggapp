class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to Matt's Plattform #{@user.name}"
			if @user.admin? 
				redirect_to posts_path
			else
				redirect_to new_post_path
			end
		else
			render 'new'
		end

	end
	def edit
		

	end

	def update
		
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to posts_path
		else
			render 'edit'
		end
	end

	def show
	
	end

	def destroy
		
		if @user.destroy
			flash[:deleted] = "The account was deleted"
			redirect_to users_path
		else
			render 'index'
		end

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password_digest)
	end
	def set_user
		@user = User.find(params[:id])
	end

end
