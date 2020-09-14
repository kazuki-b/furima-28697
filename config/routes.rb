Rails.application.routes.draw do
  root to: "tops#index"
  devise_for :users
  resources :tops
  resources :users
  resources :items

  get 'items/:id', to: 'items#calculation'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
