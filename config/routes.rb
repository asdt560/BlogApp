Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :api, defaults: { format: :json } do
    post 'users/sign_in' => 'users#login'
    get 'users/:user_id/posts' => 'posts#index'
    get 'users/:user_id/posts/:post_id/comments' => 'comments#index'
    post 'posts/:post_id/comments/new' => 'comments#create'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "users#index"
  resources :users, only: %i[show index] do
    resources :posts, only: %i[show index new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create]
    end
  end
end
