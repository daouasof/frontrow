Rails.application.routes.draw do
  get 'users/show'
  get 'reviews/create'
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show]

  resources :concerts, only: [:index, :show] do
    resources :attendances, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [] do
    member do
      post :like
      delete :unlike
    end
  end

  resources :attendances, only: :destroy
end
