Rails.application.routes.draw do
  get 'static_pages/log'

  resources :facilities
  resources :plans
  resources :companies
  resources :contacts
  resources :users
  resources :treatments
  resources :diseases
  resources :body_parts
  resources :symptoms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get  '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
