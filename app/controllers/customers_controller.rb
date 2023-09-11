class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def create
    item_id = params[:item_id].to_i
    item = Item.find(item_id)
    @customer_item = CustomerItem.create(customer: @customer, item: item)
    redirect_to "/customers/:id"
  end
end