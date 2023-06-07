Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :concerts, only: [:index, :show] do
    resources :attendances, only: [:create, :destroy]
  end
end
