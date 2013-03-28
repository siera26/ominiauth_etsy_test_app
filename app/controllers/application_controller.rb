class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def init_etsy_api
    Etsy.api_key = Figaro.env.etsy_public_key
    Etsy.api_secret = Figaro.env.etsy_secret_key
    {access_token: current_user.access_token, access_secret: current_user.access_secret}
  end
end
