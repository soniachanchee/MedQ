Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :pharmacies do
    resources :orders, only: [:create]
  end

  resources :medicines, only: :index

  get 'checkout', to: "pages#checkout", as: :checkout
end
