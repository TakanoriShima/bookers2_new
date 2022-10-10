Rails.application.routes.draw do
  devise_for :users
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
    resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
