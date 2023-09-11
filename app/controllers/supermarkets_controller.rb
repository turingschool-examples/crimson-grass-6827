class SupermarketsController < ApplicationController
  def show
    @supermarkets = Supermarket.find(params[:id])
    @customers = @supermarket.customers.distinct
  end
end