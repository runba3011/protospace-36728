Rails.application.routes.draw do
  
  devise_for :users
  root to: "prototypes#index"
  resources :users , only: [:show]
  resources :prototypes , only: [:new , :create , :show , :update , :edit , :destroy] do
    resources :comments , only: [:create]
  end


end
