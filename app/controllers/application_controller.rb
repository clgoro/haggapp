class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
 
  def current_user
	    @current_user ||= User.find(session[:user_id]["id"]) if session[:user_id]
  end

  def logged_in?
    puts "logged_in: #{current_user}"
  	!!current_user
  end

  def require_user
  	if !logge_in?
  		flash[:attention] = "You must me logged in to perform that action"
  		redirect_to root_path
  	end
  end	
end
