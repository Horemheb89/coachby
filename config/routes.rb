Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'

  resources :contracts, only: [:new, :create] do
    resources :programs, only: [:new, :create]
  end

  resources :programs, only: [] do
    resources :meals, only: [:new, :create, :index, :show]
  end

  resources :programs, only: [] do
    resources :sessions, only: [:new, :create, :index]
  end

  resources :meals, only: [] do
    resources :doses, only: [:new, :create]
  end

  resources :ingredients
  resources :contracts, only: [:index, :show]
  resources :programs, only: [:index, :show]

  get "contract/:id/index_clients", to: "programs#index_clients", as: "index_clients"
  get "contract/:id/index", to: "programs#index", as: "index"

end
