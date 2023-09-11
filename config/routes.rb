Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # User Story 1
  get "/customers/:id", to: "customers#show"

  # User Story 2
  post "/customers/:customer_id/items", to: "customer_items#create"
end
