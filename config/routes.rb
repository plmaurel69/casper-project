Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties, only: [:new, :create] do
    resources :messages, only: [:index, :create, :udpate]
  end
end
