EtsyApp::Application.routes.draw do
  get "home/index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  get "/profile" => "sessions#profile", :as => :profile
  
  root :to => 'home#index'
end
