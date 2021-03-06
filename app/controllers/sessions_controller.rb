class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_etsy_omniauth(auth)
    session[:user_id] = user.id
    
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
  
  def profile
    params = init_etsy_api
    render :text => Etsy::Request.get('/users/__SELF__', params.merge(:includes => 'Profile')).body
  end
  
end
