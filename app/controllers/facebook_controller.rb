class FacebookController < ApplicationController
	def accept_token
  	profile = Facebook.profile_for(params[:fb_token])
  	current_user = User.exists?(fb_id: profile['id'])

    if current_user
    	redirect_to new_post_path
    else
      current_user = User.create(
        name: profile['name'], 
        email: profile['email'], 
        fb_id: profile['id']
      ) 
      current_user.token = params["action"]   
      current_user.password = Facebook.profile_for(params)["id"]
      current_user.password_confirmation = Facebook.profile_for(params)["id"]
      current_user.save
    end

  	end
end

