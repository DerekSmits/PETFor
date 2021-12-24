Rails.application.routes.draw do
  devise_for :users,
  defaults: { format: :json },
  path: '',
  path_names: {
    sign_in: 'api/login',
    sign_out: 'api/logout',
    registration: 'api/signup'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  devise_for :views
  # resources :users
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "base#index"
  get 'post/post_id/comments', to: 'comments#index'
  namespace 'api' do
    resources :posts
    resources :comments
  end
end
