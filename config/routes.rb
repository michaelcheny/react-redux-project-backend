# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      post '/signup' => 'users#create'
      get '/auth-check' => 'sessions#auth_check'
      # get 'auth/:provider/callback' => 'sessions#googleAuth'
      # get 'auth/failure' => redirect('/')
      # Routes for Google authentication
      get '/auth/:provider/callback', to: 'api/v1/sessions#googleAuth'
      get '/auth/failure', to: redirect('/')
      # get '/signup' => 'accounts#new', as: 'signup'

      resources :users
      resources :reactions
      resources :comments
      resources :user_projects
      resources :projects
      
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
