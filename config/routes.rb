Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :fans do
    resources :bookings, omly: [:show, :new, :create, :update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"
end
