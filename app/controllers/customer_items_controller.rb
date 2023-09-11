class CustomerItemsController < ApplicationController
  def create
    @customer = Customer.find(params[:id])
    CustomerItem.create(customer_id: @customer.id, item_id: (params[:new_item_id]))
    redirect_to "/customers/#{@customer.id}"
  end
end