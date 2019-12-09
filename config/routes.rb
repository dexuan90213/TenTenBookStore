Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books, only: [:index, :show]
  resources :publishers, only: [:show]

  root 'books#index'

  namespace :admin do
    resources :publishers
    resources :books # /admin/books
    root 'books#index' # /admin/
  end
end
