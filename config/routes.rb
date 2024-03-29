Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations' 
  }

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get "/register", to: "devise/registrations#new"
    get '/account/edit', to: "devise/registrations#edit"
  end
  resources :recipes
  resources :units
  resources :ingredients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :account_page 
  
  get '/account', to: 'account_page#index'
  get '/account/recipes', to: 'account_page#recipes'
  root to: "landing_page#index"
end
