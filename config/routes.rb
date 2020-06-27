Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :contracts, only: [ :new, :create, :show, :index] do
    resources :programs, only: [ :new, :create, :update, :edit, :show, :show]
  end

  resources :meals do
      resources :doses, only: [:create, :show, :new]
    end
    resources :ingredients
end
