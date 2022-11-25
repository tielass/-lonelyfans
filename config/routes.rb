Rails.application.routes.draw do
  devise_for :users
  root to: "fans#index"

  get "fans/loud", to: "fans#loud", as: :loud
  get "fans/violent", to: "fans#violent", as: :violent
  get "fans/supportive", to: "fans#supportive", as: :supportive
  get "fans/serious", to: "fans#serious", as: :serious
  get "fans/settled", to: "fans#settled", as: :settled
  get "fans/goodbehaviour", to: "fans#good_behaviour", as: :goodbehaviour
  get "fans/drunk", to: "fans#drunk", as: :drunk

  resources :fans do
    resources :bookings, only: [:show, :new, :create, :update]
  end

  resources :map, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"
end
