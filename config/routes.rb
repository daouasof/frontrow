Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:update, :show] do
    get '/set_or_create_chatroom', to: 'chatrooms#set_or_create_chatroom'
  end

  post '/follow', to: 'users#follow'
  post '/unfollow', to: 'users#unfollow'

  resources :concerts, only: [:index, :show] do
    resources :attendances, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [] do
    member do
      get :like
      get :unlike
    end
    resources :comments, only: [:create]

  end

  resources :attendances, only: :destroy

  resources :chatrooms, only: [:index, :show]  do
    resources :messages, only: :create
  end
end
