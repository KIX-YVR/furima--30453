Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
    resources :purchase, only: [:index, :new, :create]
    resources :buying, only: [:save]
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
