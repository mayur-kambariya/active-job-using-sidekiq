require 'sidekiq/web'
Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only: :index
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
