class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find(params[:id])
    @customers = Customer.find_supermarket_shoppers(@supermarket)
  end
end