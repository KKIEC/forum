Rails.application.routes.draw do

  devise_for :users, controllers: {
          registrations: 'users/registrations'
        }

  get 'welcome/index'

  scope '/admin' do
    resources :users
  end

  resources :categories
  resources :topics
  resources :posts, except: :index

  root to: 'welcome#index'

end
