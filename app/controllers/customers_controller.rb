class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:customer_id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @customer.add_item(params[:id])
    redirect_to "/customers/#{@customer.id}"
  end
end