Rails.application.routes.draw do
  resources :facilities
  resources :plans
  resources :companies
  resources :contacts
  resources :users
  resources :treatments
  resources :diseases
  resources :body_parts
  resources :symptoms
  
  root   'home#index'
  get    '/signup',       to: 'users#new'
  post   '/signup',       to: 'users#create'
  get    '/body-diagram', to: 'body_parts#index'
  
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
end
