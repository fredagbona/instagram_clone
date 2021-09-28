Rails.application.routes.draw do
  root 'sessions#new'
  resources :favorites, only: [:index, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  
end
