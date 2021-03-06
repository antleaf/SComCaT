Rails.application.routes.draw do
  resources :collections
  resources :statuses
  resources :business_forms
  resources :governances
  get 'admin', to: 'admin#index'
  get 'admin/audit', to: 'admin#audit'
  get 'editorial', to: 'editorial#index'
  resources :assignments
  resources :roles
  resources :technologies
  resources :readiness_levels
  resources :functions
  resources :categories
  resources :adoption_levels
  resources :editorial_states
  # devise_for :users
  devise_for :users, :path_prefix => 'my'
  resources :users
  resources :tags, only: [:index, :show]

  root 'home#index'
  get 'home', to: 'home#index'
  get 'contribute', to: 'contribute#index'
  get 'about', to: 'about#index'
  get 'about/graph', to: 'about#graph'
  get 'feedback', to: 'feedback#index'

  # get 'home/dump_csv', to: 'home#dump_csv'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
