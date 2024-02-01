Rails.application.routes.draw do

  devise_for :users
  root to: "cameras#index"

  get 'dashboard', to: 'dashboard#index'
  get 'profiles', to: 'profiles#update'

  get 'bookings/index'
  get 'bookings/show'


  resources :cameras do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:edit, :update]
  resources :categories, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
