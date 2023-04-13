Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    resources :users, only: :create
    resource :session, only: [:show, :create, :destroy]
    resources :games, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :destroy]
    post "/cart_items/checkout", to: "cart_items#checkout"
  end

  #config/routes.rb

  get "*path", to: "static_pages#frontend_index"
end
