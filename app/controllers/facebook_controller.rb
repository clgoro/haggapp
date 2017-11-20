class FacebookController < ApplicationController

	def token
    puts "**** FB LOGIN ****"

  	profile = Facebook.profile_for(params[:token])
  	fb_user = User.exists?(fb_id: profile['id'])

    reg_user = User.find_by(fb_id: profile['id'])

    if reg_user
      session['user_id'] = reg_user
      # puts @current_user
      redirect_to root_path
    else
      reg_user = User.create(
        name: profile['name'], 
        email: profile['email'], 
        fb_id: profile['id']
      ) 
      reg_user.token = params["action"]   
      reg_user.password = profile['id']
      reg_user.password_confirmation = profile['id']
      reg_user.save

      session['user_id'] = reg_user
      redirect_to root_path
    end

    # render json: params
  end

end

