Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books, only: [:index, :show] do
    member do
      post :comment # POST /books/:id/comment, to 'books#comment'
    end
  end
  resources :publishers, only: [:show]
  # resources :comments, only: [:create]

  root 'books#index'

  namespace :admin do
    resources :publishers
    resources :categories
    resources :books # /admin/books
    root 'books#index' # /admin/
  end
end
