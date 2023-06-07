Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: "pages#home"

  resources :concerts, only: [:index, :show] do
    resources :attendances, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :attendances, only: :destroy
end
