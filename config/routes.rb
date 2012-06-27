N4c::Application.routes.draw do
  
  resources :guests, :only => [:create]

  root :to => "home#index"
  
end
