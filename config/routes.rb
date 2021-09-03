Rails.application.routes.draw do
    get 'goods/search'
    root to: 'goods#search'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to: 'users#new'
    resources :users, only: [:index, :show, :create] 
    resources :items, only: [:create, :destroy]  
end