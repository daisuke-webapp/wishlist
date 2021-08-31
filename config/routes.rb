Rails.application.routes.draw do
  get 'goods/search'
  root to: 'goods#search'
end
