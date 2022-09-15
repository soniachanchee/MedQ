Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  resources :pharmacies do
    resources :orders, only: [:create]
  end

  resources :medicines, only: :index

  resources :prescriptions, only: [:create]

  resources :orders, only: [:update, :show]

  get 'checkout', to: "pages#checkout", as: :checkout

  get 'profile', to: "pages#view_profile", as: :profile
end
