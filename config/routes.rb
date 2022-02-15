Rails.application.routes.draw do
  get 'follow_relationships/followings'
  get 'follow_relationships/followers'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :follow_relationships, only: %i(create destroy)
end
