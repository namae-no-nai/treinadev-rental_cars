Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers 
  resources :subsidiaries, only: [:index, :new, :create, :show, :update, :edit]
  resources :car_categories, only: [:index, :new, :create, :show]
  resources :clients, only: [:index, :new, :create, :show]
end
