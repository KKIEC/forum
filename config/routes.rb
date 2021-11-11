Rails.application.routes.draw do

  get 'welcome/index'


  resources :roles
  resources :users
  resources :topics
  resources :categories
  resources :posts

  root to: 'welcome#index'

end
