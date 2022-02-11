Rails.application.routes.draw do
  resources :movements
  get '/graphics' , to: 'movements#graphics'
  resources :movement_categories
  devise_for :users
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
