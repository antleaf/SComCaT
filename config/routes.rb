Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  resources :assignments
  resources :roles
  resources :relationships
  resources :technologies
  resources :readiness_levels
  resources :functions
  resources :categories
  resources :adoption_levels
  devise_for :users

  resources :tags, only: [:index, :show]

  root 'home#index'

  get 'home', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
