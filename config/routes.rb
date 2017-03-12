Rails.application.routes.draw do
  get '/users/new', to: 'registrations#new', :as => :new_user_registration
  post '/users', to: 'registrations#create', :as => :create_new_user  

  resources :users, only: [:show, :index] do
      resources :projects
  end
  
  resources :reviews
  resources :supplies




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#welcome"
  get '/home' => 'static#home', :as => :home
  get '/about' => 'static#about', :as => :about
  get '/top_rated' => 'static#top_rated', :as => :top_rated
  get '/low_cost' => 'static#low_cost', :as => :low_cost
  get '/auth/facebook/callback' => 'sessions#create'
  get '/login' => 'sessions#new', :as => :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'


end
