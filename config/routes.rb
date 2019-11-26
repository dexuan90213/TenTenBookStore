Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :show]

  root 'books#index'

  namespace :admin do
    resources :books # /admin/books
    root 'books#index' # /admin/
  end
end
