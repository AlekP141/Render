Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'artworks/index'
  get 'artworks/show'
  get 'artworks/new'
  get 'artworks/create'
  get 'artworks/destroy'
  get 'artworks/edit'
  get 'artworks/update'
  get 'users/artworks'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
