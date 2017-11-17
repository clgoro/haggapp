class SessionsController < ApplicationController
	def create 
	user = User.find_by(email: params[:sessions][:email].downcase)
		if user && user.authenticate(params[:sessions][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			if user.admin? 
				redirect_to posts_path
			else
				redirect_to new_post_path
			end
		else
			flash[:attention] = 'Something went wrong with the log in'
			render 'new'
		end
	end

	def new
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to login_path

	end
end
