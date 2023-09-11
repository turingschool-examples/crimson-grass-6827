Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # User Story 1
  get "/customers/:id", to: "customers#show"

  # User Story 2
  post "/customers/:customer_id/items", to: "customer_items#create"

  # User Story 3
  get "/items", to: "items#index"

  # Extension
  get "/supermarkets/:id", to: "supermarkets#show"
end
