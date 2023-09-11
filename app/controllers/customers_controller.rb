class CustomersController < ApplicationController
  def index

  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.permit(:id, :name)
  end
end