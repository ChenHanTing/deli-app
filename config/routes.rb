Rails.application.routes.draw do
  resources :articles
  resources :blogs
  resources :users, only: %w[index edit update]
  devise_for :users
  root to: 'pages#index'

  # api mode
  namespace :api do
    namespace :v1 do
      post 'login' => 'authentication#login'
      delete 'logout' => 'authentication#logout'
      get 'ping' => 'ping#show'
      get 'ping_auth' => 'ping#auth'
    end
  end
end
