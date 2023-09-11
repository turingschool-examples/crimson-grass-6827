Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/customers/:id", to: "customers#show"
  patch "/customers/:id", to: "customers#update"

  get "/items", to: "items#index"

  get "/supermarkets/:id", to: "supermarkets#show"
end
