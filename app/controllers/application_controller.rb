class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
 
  def current_user
	 @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logge_in?
  		flash[:attention] = "You must me logged in to perform that action"
  		redirect_to root_path
  	end
  end	
end
