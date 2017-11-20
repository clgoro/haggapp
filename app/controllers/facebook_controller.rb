class FacebookController < ApplicationController
	def accept_token
  	profile = Facebook.profile_for(params[:fb_token])
  	user = User.exists?(fb_id: profile['id'])

    if user
    	redirect_to new_post_path
    else
      user = User.create(
        name: profile['name'], 
        email: profile['email'], 
        fb_id: profile['id']
      ) 
      user.token = params["action"]   
      user.password = Facebook.profile_for(params)["id"]
      user.password_confirmation = Facebook.profile_for(params)["id"]
      user.save
    end

  	end
end

