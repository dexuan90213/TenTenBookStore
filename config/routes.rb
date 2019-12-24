Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resource :cart, only: [:show, :destroy] do
    collection do
      # /cart/2/add
      post :add, path: ':id/add'
      get :checkout
    end
  end

  resources :orders, only: [:index, :show, :create] do
    member do
      put :cancel # PUT /orders/2/cancel
      get :pay
      post :paid
    end
  end

resources :books, path: 'asdf', only: [:index, :show] do
    member do
      post :comment # POST /books/:id/comment, to 'books#comment'
    end
  end

  resources :publishers, only: [:show]
  resources :categories, only: [:show]
  
  namespace :api do
    resources :books, only: [] do
      member do
        post :favorite # /api/books/:id/favorite
      end
    end
  end

  root 'books#index'

  namespace :admin do
    resources :publishers
    resources :categories
    resources :books, path: 'asdasSFsfsffs' # /admin/books
    root 'books#index' # /admin/
  end
end
