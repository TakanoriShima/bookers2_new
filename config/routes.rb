Rails.application.routes.draw do
  devise_for :users
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :create, :edit] # 追加
end
