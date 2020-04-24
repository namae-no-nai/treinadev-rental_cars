Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers 
  resources :subsidiaries
  resources :car_categories
  resources :clients
  resources :car_models
end
