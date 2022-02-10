Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties, only: [:show, :index, :new, :create, :edit] do
    resources :property_contracts, only: [:new, :create, :show] do
      resources :messages, only: [:create]
      resources :balance_sheets, only: [:index, :show, :update, :create]
    end
  end
  resources :expenses, only: [:show, :update] do
    member do
      get :checkout
    end
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
