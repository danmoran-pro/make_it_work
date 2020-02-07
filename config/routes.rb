Rails.application.routes.draw do
  resources :projects, only: [:show]
  resources :contestants, only: [:index]
end
