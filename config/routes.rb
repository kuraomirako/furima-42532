Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: "items#index"

  resources :items do
    resources :purchases, only: [:index, :create]
  end
end