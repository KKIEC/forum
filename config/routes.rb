Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'


  resources :roles

  scope '/admin' do
    resources :users
  end

  resources :categories
  resources :topics
  resources :posts, except: :index

  root to: 'welcome#index'

end
