Rails.application.routes.draw do
  resources :logs
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
  
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'

  get    '/emergency',          to: 'static_pages#emergency'
  get    '/body-diagram/',      to: 'body_parts#diagram'
  get    '/body-diagram/:type', to: 'body_parts#diagram'
  get    '/body-parts',         to: 'body_parts#index'
  get    '/symptoms',           to: 'symptoms#index'
  get    '/diseases',           to: 'diseases#index'
  
  get    '/calculate', to: 'plans#calculate'
  post   '/calculate', to: 'plans#calculate'
end
