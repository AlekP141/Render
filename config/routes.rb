Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "artworks#home"
  resources :artworks do
    resources :bookings, only: [:new, :create, :confirm]
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:destroy]
end
