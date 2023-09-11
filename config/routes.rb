Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/customers/:customer_id", to: "customers#show"
  patch "/customers/:customer_id", to: "customers#update"

  get "/items", to: "items#index"

  get "/supermarkets/:supermarket_id", to: "supermarkets#show"
end
