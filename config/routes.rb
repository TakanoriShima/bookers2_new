Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
  resources :users, only: [:index, :show, :edit] # 追加
end
