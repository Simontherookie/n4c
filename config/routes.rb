N4c::Application.routes.draw do

  root :to => "home#index"

  get :rsvp, :to => "home#rsvp"
  get :accommodation, :to => "home#accommodation"

  namespace :admin do
    resources :guests, :only => [:index, :create, :update]
  end

  resources :guests, :only => [:create, :update]

  resource :session, :only => [:new, :create, :destroy]
  get "sessions", :to => "sessions#create"

  resources :gifts, :only => [:index, :update]
end
