class SupermarketsController < ApplicationController
  def show
    @supermarket = Supermarket.find(params[:id])
    @customers = @supermarket.find_customers
  end
end