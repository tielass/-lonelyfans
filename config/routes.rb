Rails.application.routes.draw do
  devise_for :users
  root to: "fans#index"

  resources :fans do
    resources :bookings, only: [:show, :new, :create, :update]
  end

  resources :map, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"
end
