class CustomerItemsController < ApplicationController
  def create
    @customer = Customer.find(params[:id])
    @customer_item = @customer.customer_items.create(item_id: params[:customer_item][:item_id])

    redirect_to "/customers/#{@customer.id}"
  end
end