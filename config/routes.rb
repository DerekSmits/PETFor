Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  resources :users
  resources :comments
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "base#index"
end
