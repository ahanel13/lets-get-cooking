Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :recipes
  resources :units
  resources :ingredients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "landing_page#index"
end
