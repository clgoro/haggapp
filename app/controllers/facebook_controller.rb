class FacebookController < ApplicationController
	def token
  	profile = Facebook.profile_for(params[:token])
  	current_user = User.exists?(fb_id: profile['id'])

    if current_user
    	redirect_to root_path
    else
      current_user = User.create(
        name: profile['name'], 
        email: profile['email'], 
        fb_id: profile['id']
      ) 
      current_user.token = params["action"]   
      current_user.password = profile['id']
      current_user.password_confirmation = profile['id']
      current_user.save
      redirect_to root_path
    end

    # render json: params
  end

end

