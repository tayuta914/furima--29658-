Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :orders, only: [:create, :index]
     resources :personals, only: [:create, :index]
  end
end
