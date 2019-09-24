Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/posts' => 'posts#index'

  resources :users, only: [:show]

  resources :posts do
    collection do
      get 'item'
      get 'ranking'
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

end
