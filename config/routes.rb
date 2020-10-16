Rails.application.routes.draw do
  resources :statuses
  resources :business_forms
  resources :governances
  get 'admin', to: 'admin#index'
  get 'admin/audit', to: 'admin#audit'
  resources :assignments
  resources :roles
  resources :relationships
  resources :technologies
  resources :readiness_levels
  resources :functions
  resources :categories
  resources :adoption_levels
  # devise_for :users
  devise_for :users, :path_prefix => 'my'
  resources :users
  resources :tags, only: [:index, :show]

  root 'home#index'

  get 'home', to: 'home#index'
  get 'home/graph', to: 'home#graph'
  get 'home/dump_csv', to: 'home#dump_csv'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
