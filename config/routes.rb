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

  root 'users#index'
  get '/body-diagram', to: 'body_parts#index'
end
