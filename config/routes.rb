Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'home#index', as: :authenticated_root
  end
  root 'home#index'
  resources :manufacturers 
  resources :subsidiaries
  resources :car_categories
  resources :clients do
    get 'search', on: :collection
    resources :car_rentals, only: [:new, :create]
  end
  resources :cars
  resources :car_models
  resources :rentals, only: [:index, :new, :create] do
    get 'search', on: :collection
  end
end
