N4c::Application.routes.draw do

  root :to => "home#index"

  get :info, :to => "home#info"

  namespace :admin do
    resources :guests, :only => [:index, :update]
  end

  resources :guests, :only => [:create, :update]

  resource :session, :only => [:new, :create, :destroy]
end
