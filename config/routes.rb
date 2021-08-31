Rails.application.routes.draw do
  get 'goods/search'
  root to: 'goods#search'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
end
