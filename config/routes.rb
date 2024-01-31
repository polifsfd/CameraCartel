Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  devise_for :users
  root to: "pages#home"
  resources :cameras
  resources :bookings do
    member do
      put :approve
      put :deny
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/cameras/:id/edit", to: "cameras#edit"

  # Defines the root path route ("/")
  # root "posts#index"
end
