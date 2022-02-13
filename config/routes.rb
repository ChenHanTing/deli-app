Rails.application.routes.draw do
  resources :articles
  resources :blogs
  resources :users, only: %w[index edit update]
  devise_for :users
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
