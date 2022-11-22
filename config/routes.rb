Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :fans do
    resources :bookings, only: [:show, :new, :create, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/dashboard", to: "pages#dashboard"
end
