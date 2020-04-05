Rails.application.routes.draw do
  root to: "sessions#new"

  resources :blogs do
    collection do
      post :confirm
      get :favorite_index
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
