Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    resources :users, only: :create
    resource :session, only: [:show, :create, :destroy]
    resources :games, only: [:index, :show] do
      resources :reviews, only: [:index, :create]
    end
    resources :cart_items, only: [:create, :index, :destroy]
    post "/cart_items/checkout", to: "cart_items#checkout"

    resources :reviews, only: [:update, :destroy] do
      resources :review_votes, only: [:create]
    end
    resources :review_votes, only: [:update, :destroy]
  end

  # config/routes.rb

  get "*path", to: "static_pages#frontend_index"
end
