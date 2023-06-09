Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "artworks#home"
  resources :artworks do
    resources :bookings, only: [:new, :create, :confirm]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end

  get "myartworks", to: "pages#myartworks"
  get "mybookings", to: "pages#mybookings"
end
