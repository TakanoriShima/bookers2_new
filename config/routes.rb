Rails.application.routes.draw do
  devise_for :users
  get 'home/top'
  get 'home/about'
  root to: 'home#top'
end
