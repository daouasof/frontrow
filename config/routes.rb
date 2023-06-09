Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show]

  post '/follow', to: 'users#follow'
  post '/unfollow', to: 'users#unfollow'

  resources :concerts, only: [:index, :show] do
    resources :attendances, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :attendances, only: :destroy
end
