Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :concerts, only: [:index, :show] do
    resources :attendances, only: [:create]
  end

  resources :attendances, only: :destroy
end
