Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties, only: [:show, :index, :new, :create, :edit] do
    resources :messages, only: [:index, :create]
    resources :balance_sheets, only: [:index, :show, :update, :create]
  end
end
