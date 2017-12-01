Rails.application.routes.draw do
  resources :visits
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

  post   '/users/:id',    to: 'users#update'
  get    '/map',          to: 'static_pages#map'
  get    '/resources',    to: 'static_pages#resources'
  
  get    '/body-diagram/',       to: 'body_parts#diagram'
  get    '/body-parts',          to: 'body_parts#index'
  get    '/symptoms',            to: 'symptoms#index'
  get    '/diseases',            to: 'diseases#index'

  #post   '/fetch/:what',         to: 'body_parts#load'
  
  post    '/fetch_diagram',       to: 'body_parts#load_diagram'
  post    '/fetch_symptoms',      to: 'body_parts#load_symptoms'
  post    '/fetch_ailments',      to: 'body_parts#load_ailments'
  post    '/fetch_treatment',     to: 'body_parts#load_treatment'


  get    'calculate', to: 'plans#showcalc'
  post   'calculate', to: 'plans#calculate'
end
