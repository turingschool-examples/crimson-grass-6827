Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/customers/:id', to: "customers#show"
  get 'items/:id', to: "items#show"
  post '/customers/:id/add_item', to: "customer_items#create", as: "customer_add_item"
  get '/items', to: "items#index"
  get 'supermarkets/:id', to: "supermarkets#show"
end
