class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
  end

  def create
    customer = Customer.new({
      name: params[:name]
    })
  end
end
