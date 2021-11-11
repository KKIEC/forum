Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'


  resources :roles

  scope '/admin' do
    resources :users
  end

  resources :topics
  resources :categories
  resources :posts

  root to: 'welcome#index'

end
