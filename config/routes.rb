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
  post   '/load_login',   to: 'home#load_login'
  
  post   '/users/:id',    to: 'users#update'
  get    '/map',          to: 'static_pages#map'
  get    '/resources',    to: 'static_pages#resources'

  get    '/body-diagram/',       to: 'body_parts#diagram'
  get    '/body-parts',          to: 'body_parts#index'
  get    '/symptoms',            to: 'symptoms#index'
  get    '/diseases',            to: 'diseases#index'

  post   '/fetch/:what/:id/',                        to: 'body_parts#load', as: 'fetch'
  post   '/fetch/:what/:id/:symptom_id',             to: 'body_parts#load', as: 'fetch_symptom'
  post   '/fetch/:what/:id/:symptom_id/:ailment_id', to: 'body_parts#load', as: 'fetch_ailment'
  
  post    '/fetch_diagram',       to: 'body_parts#load_diagram'
  
  get    'calculate', to: 'plans#showcalc'
  post   'calculate', to: 'plans#calculate'

  get    'print', to: 'logs#print'
end
