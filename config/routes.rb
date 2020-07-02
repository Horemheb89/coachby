Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :contracts, only: [:new, :create] do
    resources :programs, only: [:new, :create] do
    end
  end

  resources :programs, only: [] do
    resources :meals, only: [:new, :create, :index,:show]
  end

  resources :programs, only: [] do
    resources :sessions, only: [:new, :create, :index, :show]
  end

  resources :programs, only: [] do
    resources :exercises, only: [:new, :create]
  end

  resources :meals, only: [] do
    resources :doses, only: [:new, :create]
  end

    resources :ingredients
    resources :contracts, only: [:index, :show]
    resources :programs, only: [:index, :show]

end
