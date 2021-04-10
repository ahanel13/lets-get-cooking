Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments
  devise_for :users do 
  end
  
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get "/register", to: "devise/registrations#new"
    get '/editaccount', to: "devise/registrations#edit"
  end
  resources :recipes
  resources :units
  resources :ingredients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root to: "landing_page#index"
end
