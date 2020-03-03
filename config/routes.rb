# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      get '/auth-check' => 'sessions#auth_check'
      get '/signup' => 'users#new', as: 'signup'
      post '/signup' => 'users#create'
      get '/login' => 'sessions#login'
      post '/login' => 'sessions#login'
      delete '/logout' => 'sessions#logout'
      # Routes for Google authentication
      get '/auth/:provider/callback', to: 'sessions#googleAuth'
      get '/auth/failure', to: redirect('/')

      get '/personal-projects' => 'projects#personal'
      resources :users
      resources :reactions
      resources :comments
      resources :user_projects
      resources :projects
      
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
