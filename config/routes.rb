N4c::Application.routes.draw do

  root :to => "home#index"

  namespace :admin do
    resources :guests, :only => [:index, :update]
  end

  resources :guests, :only => [:create]
end
